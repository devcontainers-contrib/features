#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ncdu --version" ncdu --version

reportResults
