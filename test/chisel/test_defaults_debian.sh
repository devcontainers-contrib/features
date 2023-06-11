#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "chisel --version" chisel --version

reportResults
