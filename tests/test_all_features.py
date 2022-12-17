import ray
import pytest
import json
import time
from more_itertools import chunked
from tqdm import tqdm

CHUNK_SIZE= 10


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
    """
    example usage:

    ```
    ray start --head --disable-usage-stats --port=6379

    python3 -u -m pytest test_all_features.py -s --base_dir $GITHUB_WORKSPACE --image "mcr.microsoft.com/devcontainers/base:debian" --feature_ids $(sudo tree -J -d  ./src | sudo jq -c '.[0].contents | map(.name)')

    ray stop  
    ```
    """

    feature_ids_chunks = list(chunked(feature_ids, CHUNK_SIZE))
    ray.init(address='auto', log_to_driver=True, logging_level=0)


    @ray.remote
    def remote_ray_task(shell, args):
        ret = shell.run(args , shell=True)
        return ret

    def get_devcontainer_shell_args(base_dir: str, feature_id: str, image: str) -> str:
        return f"devcontainer features test -p {base_dir} -f {feature_id} -i {image}"

    bad_rets = []
    for feature_ids_chunk in feature_ids_chunks:
            
        futures = [remote_ray_task.remote(shell, get_devcontainer_shell_args(base_dir,feature_id, image)) for feature_id in feature_ids_chunk]

        rets = tqdm(ray_get_iterator(futures, verbose=True), total=len(futures))

        # for ret in rets:
        bad_rets.extend([ret for ret in rets if ret.returncode != 0])
    
        time.sleep(1)

        print(shell.run("docker system prune -af", shell=True).stdout)
        print(shell.run("docker image prune -af", shell=True).stdout)
        print(shell.run("docker buildx prune -af", shell=True).stdout)

    assert len(bad_rets) == 0, f"{len(bad_rets)} features failed:\n {bad_rets}"