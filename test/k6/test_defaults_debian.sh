#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "k6 version" k6 version

reportResults
