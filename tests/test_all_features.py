import ray
import os
import pytest
from tqdm import tqdm


@pytest.fixture(scope="session")
def base_dir(pytestconfig):
    return pytestconfig.getoption("base_dir")

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




def test_assert_good_exitcode(shell, base_dir: str, image: str):
    ray.init(address='auto', log_to_driver=True, logging_level=0)

    @ray.remote
    def remote_ray_task(shell, args):
        ret = shell.run(*args)
        return ret

    def get_devcontainer_shell_args(base_dir: str, feature_name: str, image: str) -> list[str]:
        return ["devcontainer", "features" ,"test", "-p", base_dir, "-f", feature_name ,"-i" ,image]

    feature_names = os.listdir(os.path.join(base_dir ,"src"))
    futures = [remote_ray_task.remote(shell, get_devcontainer_shell_args(base_dir,feature_name, image)) for feature_name in feature_names]

    rets = tqdm(ray_get_iterator(futures, verbose=True), total=len(futures))

    # for ret in rets:
    for ret in rets:
        assert ret.returncode == 0