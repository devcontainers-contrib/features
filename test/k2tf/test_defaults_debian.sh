#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "k2tf --version" k2tf --version

reportResults
