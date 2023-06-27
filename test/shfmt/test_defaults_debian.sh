#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "shfmt --version" shfmt --version

reportResults
