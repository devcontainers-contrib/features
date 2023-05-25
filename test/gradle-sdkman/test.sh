#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "gradle --version" gradle --version

reportResults
