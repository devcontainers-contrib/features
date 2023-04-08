#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "tmate -V" tmate -V

reportResults
