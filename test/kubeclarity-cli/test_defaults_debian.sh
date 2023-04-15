#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "kubeclarity-cli --version" kubeclarity-cli --version

reportResults
