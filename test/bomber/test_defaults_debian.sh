#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "bomber --version" bomber --version

reportResults
