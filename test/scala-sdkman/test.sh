#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sdk current | grep "scala"" sdk current | grep "scala"

reportResults
