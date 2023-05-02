#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "infracost --version" infracost --version

reportResults
