#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mn --help" mn --help

reportResults
