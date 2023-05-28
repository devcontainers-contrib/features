#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "dnote version" dnote version

reportResults
