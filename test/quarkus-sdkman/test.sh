#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "quarkus --version" quarkus --version

reportResults
