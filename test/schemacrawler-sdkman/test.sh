#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "type schemacrawler.sh" type schemacrawler.sh

reportResults
