#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "mkcert --version" mkcert --version

reportResults
