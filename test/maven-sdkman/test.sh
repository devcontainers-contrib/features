#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "mvn --version" mvn --version

reportResults
