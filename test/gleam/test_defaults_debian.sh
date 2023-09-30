#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "gleam --version" gleam --version

reportResults
