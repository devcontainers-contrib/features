#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "eas --version" eas --version

reportResults
