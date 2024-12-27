#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "hadoop version" hadoop version

reportResults
