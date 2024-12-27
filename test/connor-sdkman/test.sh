#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "connor --version" connor --version

reportResults
