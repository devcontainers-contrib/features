#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mulefd --version" mulefd --version

reportResults
