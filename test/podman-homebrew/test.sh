#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "podman --version" podman --version

reportResults
