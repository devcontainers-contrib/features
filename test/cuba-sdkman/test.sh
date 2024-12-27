#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cuba-cli version" cuba-cli version

reportResults
