#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "taxi --help" taxi --help

reportResults
