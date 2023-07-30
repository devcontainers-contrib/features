#!/usr/bin/env bash

KUBECTX_KUBENS_VERSION="${VERSION:-"latest"}"

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.4.45"

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/gh-release:1" \
    --option repo='ahmetb/kubectx' --option binaryNames='kubectx' --option version="$KUBECTX_KUBENS_VERSION" --option assetRegex="kubectx.*"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/gh-release:1" \
    --option repo='ahmetb/kubectx' --option binaryNames='kubens' --option version="$KUBECTX_KUBENS_VERSION" --option assetRegex="kubens.*"

echo "Done!"
