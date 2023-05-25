#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ddgr --version" ddgr --version

reportResults
