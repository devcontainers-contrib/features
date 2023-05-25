#!/bin/bash

set -e

source dev-container-features-test-lib

# we are simply checking existance for now.
# full operability depends on the existance of kubectl.
check "kubectx existance" which kubectx
check "kubens existance" which kubens

reportResults
