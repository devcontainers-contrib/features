#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "xplr --version" xplr --version

reportResults
