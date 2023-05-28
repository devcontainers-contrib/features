#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "scheme  --help" scheme  --help

reportResults
