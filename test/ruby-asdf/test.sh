#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ruby --version" ruby --version

reportResults
