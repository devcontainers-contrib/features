#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "promlens --version" promlens --version

reportResults
