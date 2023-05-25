#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "starship --version" starship --version

reportResults
