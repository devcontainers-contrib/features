#!/bin/bash

set -e

source dev-container-features-test-lib

# we are simply version for now.
# full operability depends on the existance of kubectl.
check "kubectx version" kubectx --version
check "kubens version" kubens --version

reportResults
