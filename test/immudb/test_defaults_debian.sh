#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "immudb version" immudb version

reportResults
