#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "immuclient version" immuclient version

reportResults
