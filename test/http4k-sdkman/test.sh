#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "http4k --version" http4k --version

reportResults
