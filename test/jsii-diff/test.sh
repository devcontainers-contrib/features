#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "jsii-diff --version" jsii-diff --version

reportResults
