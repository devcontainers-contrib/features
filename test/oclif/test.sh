#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "oclif --version" oclif --version

reportResults
