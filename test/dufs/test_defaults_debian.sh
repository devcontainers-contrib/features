#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "dufs --version" dufs --version

reportResults
