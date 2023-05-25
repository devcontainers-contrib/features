#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "pkg --version" pkg --version

reportResults
