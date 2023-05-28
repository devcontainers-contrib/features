#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "eget --version" eget --version

reportResults
