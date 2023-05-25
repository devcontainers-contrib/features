#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ansible --version" ansible --version

reportResults
