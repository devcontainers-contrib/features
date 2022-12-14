#!/bin/bash

set -e

source dev-container-features-test-lib

check "peco --version" peco --version

reportResults
