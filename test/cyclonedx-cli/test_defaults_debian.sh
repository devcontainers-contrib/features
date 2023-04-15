#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cyclonedx --version" cyclonedx --version

reportResults
