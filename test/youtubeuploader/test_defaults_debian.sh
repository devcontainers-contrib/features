#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "youtubeuploader --version" youtubeuploader --version

reportResults
