#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "piper version" piper version

reportResults
