#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "prometheus --version" prometheus --version

reportResults
