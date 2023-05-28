#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "tfswitch --version" tfswitch --version

reportResults
