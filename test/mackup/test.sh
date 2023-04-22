#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "mackup --version" mackup --version

reportResults
