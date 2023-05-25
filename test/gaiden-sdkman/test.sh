#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "gaiden --version" gaiden --version

reportResults
