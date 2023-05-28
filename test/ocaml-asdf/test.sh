#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ocaml --version" ocaml --version

reportResults
