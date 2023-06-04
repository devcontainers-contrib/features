#!/bin/bash -i

set -e

source dev-container-features-test-lib

# markdownlint-cli2 does not have a dedicated version check
#   The version is displayed when running the command without arguments
#   which always exits with a non-zero error code
check "prettier --version" prettier --version

reportResults