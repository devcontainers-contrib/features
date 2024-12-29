#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "elixir --version" elixir --version

reportResults
