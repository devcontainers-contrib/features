#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "json-server --version" json-server --version

reportResults
