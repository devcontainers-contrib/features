#!/usr/bin/env bash
COMPILER_TYPE="${COMPILER:-"dmd"}"
COMPILER_VERSION="${VERSION:-"latest"}"

case ${COMPILER_TYPE} in
    dmd) ;;
    ldc) ;;
    gdc) ;;
    *) echo "(!) Compiler ${COMPILER_TYPE} unsupported, choose from: 'dmd', 'ldc', 'gdc'"; exit 1 ;;
esac

# VERBOSITY=0
set -e

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

# making sure curl is there, you never know
check_packages curl xz-utils

curl -fsS https://dlang.org/install.sh > install_d.sh

# source in order to get access to the $COMPILER to be used lated to activate 
source install_d.sh install -p /usr/local/lib/dlang $COMPILER_TYPE 
rm install_d.sh

chmod +rx -R /usr/local/lib/dlang

echo "source /usr/local/lib/dlang/$COMPILER/activate" >> /etc/bash.bashrc

# Clean up 
rm -rf /var/lib/apt/lists/*

echo "Done!"