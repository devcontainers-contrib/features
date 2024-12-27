#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ki --version" ki --version

reportResults
