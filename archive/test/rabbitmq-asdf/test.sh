#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "rabbitmqctl --version" rabbitmqctl --version

reportResults
