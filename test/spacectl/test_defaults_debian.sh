#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "spacectl --version" spacectl --version

reportResults
