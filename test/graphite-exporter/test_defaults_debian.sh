#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "graphite_exporter --version" graphite_exporter --version

reportResults
