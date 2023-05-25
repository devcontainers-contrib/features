#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "actionlint --version" actionlint --version

reportResults
