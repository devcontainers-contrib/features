#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ufmt --version" ufmt --version

reportResults
