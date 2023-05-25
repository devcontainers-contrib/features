#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "projen --version" projen --version

reportResults
