#!/bin/bash -e

source bash_modules/ensure_curl.sh

ensure_curl
# https://github.com/nektos/act#bash-script
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
