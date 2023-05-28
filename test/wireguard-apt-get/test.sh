#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "wg --version" wg --version

reportResults
