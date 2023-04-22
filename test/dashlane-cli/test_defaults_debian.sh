#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "dcli --version" dcli --version

reportResults
