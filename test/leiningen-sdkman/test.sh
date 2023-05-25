#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "lein --version" lein --version

reportResults
