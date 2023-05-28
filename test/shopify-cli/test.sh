#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "shopify --version" shopify --version

reportResults
