#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "jbang --version" jbang --version

reportResults
