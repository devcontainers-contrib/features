#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "opam is installed" opam --version
check "OCaml is installed" ocamlc --version

# TODO: check "[WARNING] The environment is not in sync with the current switch." not present

reportResults
