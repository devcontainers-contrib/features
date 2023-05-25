#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "direnv --version" direnv --version

reportResults
