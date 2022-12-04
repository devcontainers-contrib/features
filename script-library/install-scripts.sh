#!/usr/bin/env bash
updaterc() {
    # This is part of devcontainers-contrib script library
    # source: https://github.com/devcontainers-contrib/features/tree/v1.1.8/script-library
    echo "Updating /etc/bash.bashrc and /etc/zsh/zshrc..."
    if [[ "$(cat /etc/bash.bashrc)" != *"$1"* ]]; then
        echo -e "$1" >> /etc/bash.bashrc
    fi
    if [ -f "/etc/zsh/zshrc" ] && [[ "$(cat /etc/zsh/zshrc)" != *"$1"* ]]; then
        echo -e "$1" >> /etc/zsh/zshrc
    fi
}

check_packages() {
    # This is part of devcontainers-contrib script library
    # source: https://github.com/devcontainers-contrib/features/tree/v1.1.8/script-library
  if ! dpkg -s "$@" > /dev/null 2>&1; then
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
      echo "Running apt-get update..."
      apt-get update -y
    fi
    apt-get -y install --no-install-recommends "$@"
  fi
}

install_via_npm() {
    # This is part of devcontainers-contrib script library
    # source: https://github.com/devcontainers-contrib/features/tree/v1.1.8/script-library
    PACKAGE=$1
    
    # install node+npm if does not exists
    if ! type npm >/dev/null 2>&1; then
        echo "Installing node and npm..."
        check_packages curl
        curl -fsSL https://raw.githubusercontent.com/devcontainers/features/main/src/node/install.sh | $SHELL
        export NVM_DIR=/usr/local/share/nvm
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    fi
    npm install -g --omit=dev $PACKAGE
}


install_via_asdf() {
    # This is part of devcontainers-contrib script library
    # source: https://github.com/devcontainers-contrib/features/tree/v1.1.8/script-library
    PACKAGE=$1
    VERSION=$2
    REPO=$3

    # install git and curl if does not exists
    check_packages curl git
    if ! type asdf >/dev/null 2>&1; then
        su - "$_REMOTE_USER" <<EOF
            git clone --depth=1 \
            -c core.eol=lf \
            -c core.autocrlf=false \
            -c fsck.zeroPaddedFilemode=ignore \
            -c fetch.fsck.zeroPaddedFilemode=ignore \
            -c receive.fsck.zeroPaddedFilemode=ignore \
            "https://github.com/asdf-vm/asdf.git" $_REMOTE_USER_HOME/.asdf 2>&1
            . $_REMOTE_USER_HOME/.asdf/asdf.sh

            asdf plugin-add "$PACKAGE" "$REPO"
            asdf install "$PACKAGE" "$VERSION"
            asdf global "$PACKAGE" "$VERSION"
EOF
    fi
    updaterc ". $_REMOTE_USER_HOME/.asdf/asdf.sh"
}


install_via_pipx() {
    # This is part of devcontainers-contrib script library
    # source: https://github.com/devcontainers-contrib/features/tree/v1.1.8/script-library
    PACKAGES=("$@")
    arraylength="${#PACKAGES[@]}"

    env_name=$(echo ${PACKAGES[0]} | cut -d "=" -f 1 | cut -d "<" -f 1 | cut -d ">" -f 1 )

    # if no python - install it
    if ! dpkg -s python3-minimal python3-pip libffi-dev python3-venv > /dev/null 2>&1; then
        apt-get update -y
        apt-get -y install python3-minimal python3-pip libffi-dev python3-venv
    fi
    export PIPX_HOME=/usr/local/pipx
    mkdir -p ${PIPX_HOME}
    export PIPX_BIN_DIR=/usr/local/bin
    export PYTHONUSERBASE=/tmp/pip-tmp
    export PIP_CACHE_DIR=/tmp/pip-tmp/cache
    pipx_bin=pipx
    # if pipx not exists - install it
    if ! type pipx > /dev/null 2>&1; then
        pip3 install --disable-pip-version-check --no-cache-dir --user pipx
        pipx_bin=/tmp/pip-tmp/bin/pipx
    fi
    # install main package
    ${pipx_bin} install --pip-args '--no-cache-dir --force-reinstall' -f "${PACKAGES[0]}"
    # install injections (if provided)
    for (( i=1; i<${arraylength}; i++ ));
    do
    ${pipx_bin} inject $env_name --pip-args '--no-cache-dir --force-reinstall' -f "${PACKAGES[$i]}"
    done

    # cleaning pipx to save disk space
    rm -rf /tmp/pip-tmp
}


find_version_from_git_tags() {
    # This is part of devcontainers-contrib script library
    # source: https://github.com/devcontainers-contrib/features/tree/v1.1.8/script-library
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
    if [ -z "${!variable_name}" ] || ! echo "${version_list}" | grep "^${!variable_name//./\\.}$" > /dev/null 2>&1; then
        echo -e "Invalid ${variable_name} value: ${requested_version}\nValid values:\n${version_list}" >&2
        exit 1
    fi
    echo "${variable_name}=${!variable_name}"
}
