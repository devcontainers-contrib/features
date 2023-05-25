#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "sops --version" sops --version

reportResults
