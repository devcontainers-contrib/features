#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "pip-audit --version" pip-audit --version

reportResults
