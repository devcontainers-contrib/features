#!/bin/bash

set -e

source dev-container-features-test-lib


check "nothing is installted when package is empty" exit 0

reportResults
