#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "vertx --version" vertx --version

reportResults
