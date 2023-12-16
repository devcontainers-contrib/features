#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "devcontainer --version" devcontainer --version

reportResults
