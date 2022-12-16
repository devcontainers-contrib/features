
def pytest_addoption(parser):
    parser.addoption("--base_dir", action="store")
    parser.addoption("--image", action="store")
    parser.addoption("--feature_ids", action="store")

option = None

def pytest_configure(config):
    global option
    option = config.option
    print(config.option)