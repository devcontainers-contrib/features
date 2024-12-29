#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "volta --version" volta --version

reportResults
