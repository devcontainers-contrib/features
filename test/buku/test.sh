#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "buku --version" buku --version

reportResults
