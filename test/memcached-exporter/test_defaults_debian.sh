#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "memcached_exporter --version" memcached_exporter --version

reportResults
