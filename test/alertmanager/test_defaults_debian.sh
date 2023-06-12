#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "alertmanager --version" alertmanager --version

reportResults
