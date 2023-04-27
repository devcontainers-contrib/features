#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "release --version" release --version

reportResults
