#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "hash markdownlint-cli2" hash markdownlint-cli2

reportResults
