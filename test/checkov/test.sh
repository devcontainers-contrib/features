#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "checkov -v" checkov -v

reportResults
