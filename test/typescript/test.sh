#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "tsc --version" tsc --version

reportResults
