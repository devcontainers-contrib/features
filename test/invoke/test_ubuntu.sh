#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "invoke --version" invoke --version

reportResults
