#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "type kotlin" type kotlin

reportResults
