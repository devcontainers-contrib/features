import ray
import os
import pytest
import json

from tqdm import tqdm

@pytest.fixture(scope="session")
def base_dir(pytestconfig):
    return pytestconfig.getoption("base_dir")


@pytest.fixture(scope="session")
def feature_ids(pytestconfig):
    feature_ids_str = pytestconfig.getoption("feature_ids")
    return json.loads(feature_ids_str)

@pytest.fixture(scope="session")
def image(pytestconfig):
    return pytestconfig.getoption("image")

def ray_get_iterator(obj_ids, verbose: bool):
    while obj_ids:
        done, obj_ids = ray.wait(obj_ids)
        ret= ray.get(done[0])
        if verbose:
            print(ret.stdout)
            print(ret.stderr)
        yield ret



def test_assert_good_exitcode(shell, base_dir: str, image: str, feature_ids: list[str]):

    ray.init(address='auto', log_to_driver=True, logging_level=0)

    @ray.remote
    def remote_ray_task(shell, args):
        ret = shell.run(args , shell=True)
        return ret

    def get_devcontainer_shell_args(base_dir: str, feature_id: str, image: str) -> list[str]:
        return f"devcontainer features test -p {base_dir} -f {feature_id} -i {image} && docker system prune -a -f && docker buildx prune -a -f --keep-storage=1gb --verbose"
        
    futures = [remote_ray_task.remote(shell, get_devcontainer_shell_args(base_dir,feature_id, image)) for feature_id in feature_ids]

    rets = tqdm(ray_get_iterator(futures, verbose=True), total=len(futures))

    # for ret in rets:
    bad_rets = [ret for ret in rets if ret.returncode != 0]

    assert len(bad_rets) == 0, f"{len(bad_rets)} features failed:\n {bad_rets}"