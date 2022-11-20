#!/usr/bin/env bash

GHC_VERSION="${GHCVERSION:-"latest"}"
CABAL_VERSION="${CABALVERSION:-"latest"}" 
INCLUDE_STACK="${INSTALLSTACK:-"true"}" 
ADJUST_BASHRC="${ADJUSTBASH:-"true"}" 

INSTALL_STACK_GHCUP_HOOK="${INSTALLSTACKGHCUPHOOK:-"true"}"

# Clean up 
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            echo "Running apt-get update..."
            apt-get update -y
        fi
        apt-get -y install --no-install-recommends "$@"
    fi
}

check_packages curl build-essential libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5

export BOOTSTRAP_HASKELL_NONINTERACTIVE=1
export GHCUP_USE_XDG_DIRS=1
export BOOTSTRAP_HASKELL_GHC_VERSION="${GHC_VERSION}" 
export BOOTSTRAP_HASKELL_CABAL_VERSION="${CABAL_VERSION}"
export BOOTSTRAP_HASKELL_DOWNLOADER="curl"

if [[ "${INCLUDE_STACK}" = "false" ]] ; then
    export BOOTSTRAP_HASKELL_INSTALL_NO_STACK="true"
fi
if [[ "${ADJUST_BASH}" = "true" ]] ; then
    export BOOTSTRAP_HASKELL_ADJUST_BASHRC="true"
fi
if [[ "${INSTALL_STACK_GHCUP_HOOK}" = "false" ]] ; then
    export BOOTSTRAP_HASKELL_INSTALL_NO_STACK_HOOK="true"
fi

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | $SHELL


# without restarting the shell, ghci location would not be resolved from the updated PATH
exec $SHELL

# Clean up 
rm -rf /var/lib/apt/lists/*

echo "Done!"