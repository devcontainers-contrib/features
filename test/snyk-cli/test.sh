#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "snyk --version" snyk --version

reportResults
