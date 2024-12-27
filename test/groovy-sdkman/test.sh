#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "groovy --version" groovy --version

reportResults
