#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "drone --version" drone --version

reportResults
