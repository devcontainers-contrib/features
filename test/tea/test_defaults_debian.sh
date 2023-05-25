#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "tea --version" tea --version

reportResults
