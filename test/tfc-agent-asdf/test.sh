#!/bin/bash

set -e

source dev-container-features-test-lib

check "tfc-agent -v" tfc-agent -v

reportResults
