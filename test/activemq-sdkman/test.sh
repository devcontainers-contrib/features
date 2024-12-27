#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "activemq --version" activemq --version

reportResults
