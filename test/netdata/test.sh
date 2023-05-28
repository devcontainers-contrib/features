#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "netdata -version" netdata -version

reportResults
