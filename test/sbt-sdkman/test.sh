#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "sdk current | grep "sbt"" sdk current | grep "sbt"

reportResults
