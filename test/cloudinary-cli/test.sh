#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cld --version" cld --version

reportResults
