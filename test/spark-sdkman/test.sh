#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "spark-class --version" spark-class --version

reportResults
