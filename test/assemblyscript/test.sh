#!/bin/bash

set -e

source dev-container-features-test-lib

check "asc --version" asc --version

reportResults
