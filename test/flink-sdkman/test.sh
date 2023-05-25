#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "flink --version" flink --version

reportResults
