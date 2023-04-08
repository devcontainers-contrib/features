#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "fd --version" fd --version

reportResults
