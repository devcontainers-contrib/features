#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "xonsh --version" xonsh --version

reportResults
