#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "type tomcat-native.tar.gz" type tomcat-native.tar.gz

reportResults
