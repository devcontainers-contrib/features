#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ant -version" ant -version

reportResults
