#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "haxe --version" haxe --version

reportResults
