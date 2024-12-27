#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "flink --version" flink --version

reportResults
