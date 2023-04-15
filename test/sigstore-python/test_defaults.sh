#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "sigstore --version" sigstore --version

reportResults
