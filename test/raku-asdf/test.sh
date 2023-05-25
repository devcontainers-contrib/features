#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "raku --version" raku --version

reportResults
