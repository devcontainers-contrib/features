
def pytest_addoption(parser):
    parser.addoption("--base_dir", action="store")
    parser.addoption("--image", action="store")