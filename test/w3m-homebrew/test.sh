#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "w3m -version" w3m -version

reportResults
