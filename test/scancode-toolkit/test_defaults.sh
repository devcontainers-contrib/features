#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "scancode --version" scancode --version

reportResults
