#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "pbiviz --version" pbiviz --version

reportResults
