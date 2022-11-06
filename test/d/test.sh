#!/bin/bash

set -e

source dev-container-features-test-lib

check "dub exists" ls /usr/local/lib/dub

reportResults