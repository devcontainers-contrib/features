#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "gradle-profiler --version" gradle-profiler --version

reportResults
