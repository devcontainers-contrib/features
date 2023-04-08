#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "pandoc --version" pandoc --version

reportResults
