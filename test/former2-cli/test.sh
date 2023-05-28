#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "former2 --version" former2 --version

reportResults
