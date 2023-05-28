#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "activemq --version" activemq --version

reportResults
