#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cloud-nuke --version" cloud-nuke --version

reportResults
