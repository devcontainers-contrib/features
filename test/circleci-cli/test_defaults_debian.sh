#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "circleci version" circleci version

reportResults
