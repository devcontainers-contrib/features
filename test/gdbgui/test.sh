#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "gdbgui --version" gdbgui --version

reportResults
