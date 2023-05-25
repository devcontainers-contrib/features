#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ory version" ory version

reportResults
