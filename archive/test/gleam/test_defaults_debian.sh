#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gleam --version" gleam --version

reportResults
