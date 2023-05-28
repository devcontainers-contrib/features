#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "rollup --version" rollup --version

reportResults
