#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "sdk current | grep "webtau"" sdk current | grep "webtau"

reportResults
