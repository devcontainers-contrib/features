#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "pass --version" pass --version

reportResults
