#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "node --version" node --version

reportResults
