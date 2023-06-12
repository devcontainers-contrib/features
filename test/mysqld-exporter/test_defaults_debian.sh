#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "mysqld_exporter --version" mysqld_exporter --version

reportResults
