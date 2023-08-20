#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "kubectx --version" kubectx --version

check "kubens --version" kubens --version

reportResults
