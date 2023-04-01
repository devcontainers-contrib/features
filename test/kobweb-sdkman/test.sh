#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "kobweb --version" kobweb --version

reportResults
