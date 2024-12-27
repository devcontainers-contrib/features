#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "toolkit --help" toolkit --help

reportResults
