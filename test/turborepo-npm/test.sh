#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "turbo --version" turbo --version

reportResults
