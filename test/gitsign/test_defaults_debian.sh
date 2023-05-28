#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "gitsign version" gitsign version

reportResults
