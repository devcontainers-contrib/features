#!/bin/bash

set -e

source dev-container-features-test-lib

check "vtop --version" vtop --version

reportResults
