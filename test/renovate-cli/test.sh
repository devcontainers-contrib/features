#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "renovate --version" renovate --version

reportResults
