#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "spring --version" spring --version

reportResults
