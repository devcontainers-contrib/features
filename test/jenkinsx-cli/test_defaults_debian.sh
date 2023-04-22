#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "jx version" jx version

reportResults
