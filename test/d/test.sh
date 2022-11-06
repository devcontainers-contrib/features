#!/bin/bash

set -e

source dev-container-features-test-lib

check "environment DMD exists"  [[ -n "$DMD" ]]

reportResults