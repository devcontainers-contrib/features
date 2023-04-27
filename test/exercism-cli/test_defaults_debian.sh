#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "exercism version" exercism version

reportResults
