#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "conc --help" conc --help

reportResults
