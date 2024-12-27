#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "grails --version" grails --version

reportResults
