#!/bin/bash

set -e

source dev-container-features-test-lib

check "mitmproxy --version" mitmproxy --version

reportResults