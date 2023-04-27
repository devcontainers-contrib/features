#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "lighthouse --version" lighthouse --version

reportResults
