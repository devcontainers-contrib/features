#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "sanity --version" sanity --version

reportResults
