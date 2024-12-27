#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "meson --version" meson --version

reportResults
