#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "surge --version" surge --version

reportResults
