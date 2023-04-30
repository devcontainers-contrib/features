#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "jsii --version" jsii --version

reportResults
