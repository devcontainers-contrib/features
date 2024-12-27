#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "type trello" type trello

reportResults
