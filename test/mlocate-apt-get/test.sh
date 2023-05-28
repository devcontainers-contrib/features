#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "locate --version" locate --version

reportResults
