#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "nvim --version" nvim --version

reportResults
