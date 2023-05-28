#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "squarespace-server --version" squarespace-server --version

reportResults
