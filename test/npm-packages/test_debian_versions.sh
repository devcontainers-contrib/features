#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "eslint version is equal to 9.20.1" bash -c "eslint --version | grep 'v9.20.1'"
check "nodemon is installed" nodemon --version
check "prettier version is equal to 3.5.2" bash -c "prettier --version | grep '3.5.2'"

reportResults
