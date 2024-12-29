#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "bw --version" bw --version

reportResults
