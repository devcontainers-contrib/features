#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "netlify --version" netlify --version

reportResults
