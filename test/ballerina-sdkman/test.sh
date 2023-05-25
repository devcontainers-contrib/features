#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ballerina version" ballerina version

reportResults
