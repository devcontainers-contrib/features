#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "apko version" apko version

reportResults
