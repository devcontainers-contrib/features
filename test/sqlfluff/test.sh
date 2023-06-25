#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "sqlfluff --version" sqlfluff --version

reportResults
