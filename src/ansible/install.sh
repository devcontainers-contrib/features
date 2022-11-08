#!/usr/bin/env bash

UTIL_VERSION="${VERSION:-"latest"}"

set -e

# Clean up
rm -rf /var/lib/apt/lists/*


if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi


updaterc() {
    if [ "${UPDATE_RC}" = "true" ]; then
        echo "Updating /etc/bash.bashrc and /etc/zsh/zshrc..."
        if [[ "$(cat /etc/bash.bashrc)" != *"$1"* ]]; then
            echo -e "$1" >> /etc/bash.bashrc
        fi
        if [ -f "/etc/zsh/zshrc" ] && [[ "$(cat /etc/zsh/zshrc)" != *"$1"* ]]; then
            echo -e "$1" >> /etc/zsh/zshrc
        fi
    fi
}

# settings these will allow us to clean leftovers later on
export PYTHONUSERBASE=/tmp/pip-tmp
export PIP_CACHE_DIR=/tmp/pip-tmp/cache


# install python if does not exists
if ! type pip3 > /dev/null 2>&1; then
    echo "Installing python3..."
    # If the python feature script had option to install pipx without the 
    # additional tools we would have used that, but since it doesnt 
    # we have to disable it with INSTALLTOOLS=false and install
    # pipx manually later on

    export VERSION="system" 
    export INSTALLTOOLS="false"
    curl -fsSL https://raw.githubusercontent.com/devcontainers/features/main/src/python/install.sh | $SHELL
fi

# configuring install location 
# changing /usr/local/bin as we know it will be in PATH of all users
export PIPX_BIN_DIR="/usr/local/bin"

if ! type pipx > /dev/null 2>&1; then
    echo "Installing pipx..."
    export PIPX_HOME=/opt/pipx
    mkdir -p ${PIPX_HOME}
    chmod -R g+r+w "${PIPX_HOME}"

    pip3 install --disable-pip-version-check --no-cache-dir --user pipx 2>&1
    /tmp/pip-tmp/bin/pipx install --pip-args=--no-cache-dir pipx
    PIPX_COMMAND=/tmp/pip-tmp/bin/pipx
else
    PIPX_COMMAND=pipx
fi

if [ "${UTIL_VERSION}" == "latest" ]; then
	util_command="ansible-core"
else
	util_command="ansible-core==$UTIL_VERSION"
fi

echo "Installing ansible-core ..."
"${PIPX_COMMAND}" install --system-site-packages --force --pip-args '--no-cache-dir --force-reinstall' ${util_command}

# cleaning after pip
rm -rf /tmp/pip-tmp

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"