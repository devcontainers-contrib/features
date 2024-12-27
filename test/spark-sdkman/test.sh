#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "spark-class --version" spark-class --version

reportResults
