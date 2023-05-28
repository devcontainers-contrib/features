#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "tkn version" tkn version

reportResults
