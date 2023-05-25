#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "groovy --version" groovy --version

reportResults
