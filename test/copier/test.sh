#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "copier --version" copier --version

reportResults
