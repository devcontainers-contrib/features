#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "truffle --version" truffle --version

reportResults
