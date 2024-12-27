#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "btrace --version" btrace --version

reportResults
