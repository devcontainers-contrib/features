#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "syncthing --version" syncthing --version

reportResults
