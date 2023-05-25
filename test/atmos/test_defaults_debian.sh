#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "atmos version" atmos version

reportResults
