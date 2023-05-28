#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cyclonedx-py --help" cyclonedx-py --help

reportResults
