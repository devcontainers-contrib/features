#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sdk current | grep "scalacli"" sdk current | grep "scalacli"

reportResults
