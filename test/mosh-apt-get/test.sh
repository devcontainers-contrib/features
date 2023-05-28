#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "mosh --version" mosh --version

reportResults
