#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "mvnd --version" mvnd --version

reportResults
