#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "type mlton" type mlton

reportResults
