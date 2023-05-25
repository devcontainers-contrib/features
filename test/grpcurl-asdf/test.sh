#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "grpcurl --version" grpcurl --version

reportResults
