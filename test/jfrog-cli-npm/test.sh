#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "jf --version" jf --version

reportResults
