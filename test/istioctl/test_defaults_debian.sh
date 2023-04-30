#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "istioctl version" istioctl version

reportResults
