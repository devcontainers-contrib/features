#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "sfdx --version" sfdx --version

reportResults
