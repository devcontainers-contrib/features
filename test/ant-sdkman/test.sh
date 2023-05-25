#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ant -version" ant -version

reportResults
