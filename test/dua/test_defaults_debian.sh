#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "dua --version" dua --version

reportResults
