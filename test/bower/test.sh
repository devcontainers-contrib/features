#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "bower --version" bower --version

reportResults
