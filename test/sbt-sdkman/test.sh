#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sdk current | grep "sbt"" sdk current | grep "sbt"

reportResults
