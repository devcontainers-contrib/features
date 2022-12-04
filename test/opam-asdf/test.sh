#!/bin/bash

set -e

source dev-container-features-test-lib

check "opam --version" opam --version

reportResults
