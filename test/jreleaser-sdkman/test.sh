#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "jreleaser --version" jreleaser --version

reportResults
