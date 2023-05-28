#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "jake --version" jake --version

reportResults
