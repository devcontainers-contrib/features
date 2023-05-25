#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "protoc --version" protoc --version

reportResults
