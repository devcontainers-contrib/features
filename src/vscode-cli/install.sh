#!/usr/bin/env bash

. ./library_scripts.sh

VSCODE_VERSION="${VERSION:-"latest"}"

set -e

if [ "$(id -u)" -ne 0 ]; then
	echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

ARCH="$(uname -m)"
if [ "${ARCH}" == "x86_64" ] ; then
	if [ -f "/lib/ld-musl-x86_64.so.1" ] ; then
		ARCH="alpine-x64"
	else
		ARCH="linux-x64"
	fi
elif [ "${ARCH}" == "aarch64" ] || [ "${ARCH}" == "arm64" ] ; then
	if [ -f "/lib/ld-musl-aarch64.so.1" ] ; then
		ARCH="alpine-arm64"
	else
		ARCH="linux-arm64"
	fi
elif [ "${ARCH}" == "arm" ]; then
	ARCH="linux-armhf"
else
	echo -e "unsupported arch: ${ARCH}"
	exit 1
fi

DOWNLOAD_URL="https://update.code.visualstudio.com/${VSCODE_VERSION}/cli-${ARCH}/stable/"

# make sure /usr/local/lib exists
mkdir -p /usr/local/lib

# remove existing installations
rm -rf /usr/local/lib/vscode-cli-${ARCH}
rm -f $(command -v code) || true
rm -f /usr/local/bin/code

DOWNLOAD_PATH=$(mktemp)
clean_download ${DOWNLOAD_URL} ${DOWNLOAD_PATH}

# download binary and untar
tar xz -C /usr/local/bin -f ${DOWNLOAD_PATH}

rm ${DOWNLOAD_PATH}

echo "Done!"
