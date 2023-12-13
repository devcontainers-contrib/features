#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "composer --version" composer --version

reportResults
