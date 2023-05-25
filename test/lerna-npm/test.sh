#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "lerna --version" lerna --version

reportResults
