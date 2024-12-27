#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "serverless --version" serverless --version

reportResults
