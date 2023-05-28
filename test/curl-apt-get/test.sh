#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "curl --version" curl --version

reportResults
