#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "type akamai" type akamai

reportResults
