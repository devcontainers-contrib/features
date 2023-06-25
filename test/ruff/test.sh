#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ruff --version" ruff --version

reportResults
