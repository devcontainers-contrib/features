#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "type doctoolchain" type doctoolchain

reportResults
