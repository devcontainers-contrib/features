#shellcheck shell=bash

function ensure_curl() {
  if ! command -v curl >/dev/null 2>&1; then
    if [[ $(find /var/lib/apt/lists/* | wc -l) = 0 ]]; then
      echo "+ apt-get update"
      apt-get update -y
    fi

    echo "+ apt-get install curl"
    apt-get install -y --no-install-recommends curl
  fi
}
