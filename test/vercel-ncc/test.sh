#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ncc --version" ncc --version

reportResults
