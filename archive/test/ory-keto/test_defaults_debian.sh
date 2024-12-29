#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "keto version" keto version

reportResults
