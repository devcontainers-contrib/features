#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "pierrot --version" pierrot --version

reportResults
