#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "jsii-pacmak --version" jsii-pacmak --version

reportResults
