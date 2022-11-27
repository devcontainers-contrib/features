#!/usr/bin/env bash

KUBCTX_KUBENS_VERSION="${VERSION:-"latest"}"

set -e

# Clean up
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

# Checks if packages are installed and installs them if not
check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

# Figure out correct version of a three part version number is not passed
find_version_from_git_tags() {
	local variable_name=$1
	local requested_version=${!variable_name}
	if [ "${requested_version}" = "none" ]; then return; fi
	local repository=$2
	local prefix=${3:-"tags/v"}
	local separator=${4:-"."}
	local last_part_optional=${5:-"false"}
	if [ "$(echo "${requested_version}" | grep -o "." | wc -l)" != "2" ]; then
		local escaped_separator=${separator//./\\.}
		local last_part
		if [ "${last_part_optional}" = "true" ]; then
			last_part="(${escaped_separator}[0-9]+)?"
		else
			last_part="${escaped_separator}[0-9]+"
		fi
		local regex="${prefix}\\K[0-9]+${escaped_separator}[0-9]+${last_part}$"
		local version_list="$(git ls-remote --tags ${repository} | grep -oP "${regex}" | tr -d ' ' | tr "${separator}" "." | sort -rV)"
		if [ "${requested_version}" = "latest" ] || [ "${requested_version}" = "current" ] || [ "${requested_version}" = "lts" ]; then
			declare -g ${variable_name}="$(echo "${version_list}" | head -n 1)"
		else
			set +e
			declare -g ${variable_name}="$(echo "${version_list}" | grep -E -m 1 "^${requested_version//./\\.}([\\.\\s]|$)")"
			set -e
		fi
	fi
	if [ -z "${!variable_name}" ] || ! echo "${version_list}" | grep "^${!variable_name//./\\.}$" >/dev/null 2>&1; then
		echo -e "Invalid ${variable_name} value: ${requested_version}\nValid values:\n${version_list}" >&2
		exit 1
	fi
	echo "${variable_name}=${!variable_name}"
}

find_version_from_git_tags KUBCTX_KUBENS_VERSION 'https://github.com/ahmetb/kubectx'

check_packages curl

curl -L -o /usr/local/bin/kubectx https://raw.githubusercontent.com/ahmetb/kubectx/v${KUBCTX_KUBENS_VERSION}/kubectx &&
	curl -L -o /usr/local/bin/kubens https://raw.githubusercontent.com/ahmetb/kubectx/v${KUBCTX_KUBENS_VERSION}/kubens &&
	chmod +x /usr/local/bin/kubectx &&
	chmod +x /usr/local/bin/kubens

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
