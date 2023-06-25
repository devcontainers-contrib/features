#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "dbt-coverage --help" dbt-coverage --help

reportResults
