#!/usr/bin/env bash
set -ex

PACKAGES="${PACKAGES:-""}"

# Clean up
rm -rf /var/lib/apt/lists/*

if [ -z "$PACKAGES" ]; then
	echo -e "'packages' variable is empty, skipping"
	exit 0
fi

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as 
    root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

check_packages() {
	# This is part of devcontainers-contrib script library
	# source: https://github.com/devcontainers-contrib/features/tree/v1.1.8/script-library
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

packages_array=("$PACKAGES")

# shellcheck disable=SC2068
check_packages ${packages_array[@]}
