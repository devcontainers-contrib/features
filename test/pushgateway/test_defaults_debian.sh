#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "pushgateway --version" pushgateway --version

reportResults
