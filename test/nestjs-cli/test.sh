#!/bin/bash

set -e

source dev-container-features-test-lib

check "nest --version" nest --version

reportResults
