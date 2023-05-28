#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "hyperfine --version" hyperfine --version

reportResults
