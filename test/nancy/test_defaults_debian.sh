#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "nancy --version" nancy --version

reportResults
