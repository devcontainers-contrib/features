#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "btrace --version" btrace --version

reportResults
