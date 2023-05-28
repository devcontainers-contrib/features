#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "pierrot --version" pierrot --version

reportResults
