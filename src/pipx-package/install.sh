#!/usr/bin/env bash
set -e

PACKAGE=${PACKAGE:-""}
VERSION=${VERSION:-"latest"}
INJECTIONS=${INJECTIONS:-""}
INCLUDEDEPS=${INCLUDEDEPS:-"false"}
INTERPRETER=${INTERPRETER:-"python3"}

#  PEP 668  compatibility 
export PIP_BREAK_SYSTEM_PACKAGES=1

# Clean up
rm -rf /var/lib/apt/lists/*

if [ -z "$PACKAGE" ]; then
	echo -e "'package' variable is empty, skipping"
	exit 0
fi

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as
    root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

updaterc() {
	if cat /etc/os-release | grep "ID_LIKE=.*alpine.*\|ID=.*alpine.*" ; then
		echo "Updating /etc/profile"
		echo -e "$1" >>/etc/profile
	fi
	if [[ "$(cat /etc/bash.bashrc)" != *"$1"* ]]; then
		echo "Updating /etc/bash.bashrc"
		echo -e "$1" >>/etc/bash.bashrc
	fi
	if [ -f "/etc/zsh/zshrc" ] && [[ "$(cat /etc/zsh/zshrc)" != *"$1"* ]]; then
		echo "Updating /etc/zsh/zshrc"
		echo -e "$1" >>/etc/zsh/zshrc
	fi
}

install_via_pipx() {
	local INTERPRETER=$1
	local PACKAGE=$2
	local VERSION=$3
	local INJECTIONS=$4
	local INCLUDEDEPS=$5
	if [ "$INTERPRETER" = "python3" ]; then

		# if no python - install it
		if ! type python3 >/dev/null 2>&1; then
			echo "installing python3-minimal libffi-dev"
			apt-get update -y
			apt-get -y install python3-minimal
		fi

		# if no pip - install it
		if ! type pip3 >/dev/null 2>&1; then
			echo "installing python3-pip"
			apt-get update -y
			apt-get -y install libffi-dev python3-pip
		fi

		if ! python3 -Im ensurepip --version >/dev/null 2>&1; then
			echo "installing python3-venv"
			apt-get update -y
			apt-get -y install python3-venv
		fi
	fi

	if ! type "$INTERPRETER"; then
		echo "interpreter given is invalid: $INTERPRETER"
		exit 1
	fi

	export PYTHONUSERBASE=/tmp/pip-tmp
	export PIP_CACHE_DIR=/tmp/pip-tmp/cache

	export PIPX_HOME=${PIPX_HOME:-"/usr/local/py-utils"}
	export PIPX_BIN_DIR="${PIPX_HOME}/bin"
	mkdir -p "${PIPX_HOME}"

	# if pipx not exists - install it
	if ! $INTERPRETER -m pip list | grep pipx >/dev/null 2>&1; then

		PATH="${PATH}:${PIPX_BIN_DIR}"

		# Create pipx group, dir, and set sticky bit
		if ! cat /etc/group | grep -e "^pipx:" >/dev/null 2>&1; then
			groupadd -r pipx
		fi
		usermod -a -G pipx "${_REMOTE_USER}"
		umask 0002
		mkdir -p "${PIPX_BIN_DIR}"
		chown -R "${_REMOTE_USER}:pipx" "${PIPX_HOME}"
		chmod -R g+r+w "${PIPX_HOME}"
		find "${PIPX_HOME}" -type d -print0 | xargs -0 -n 1 chmod g+s

		$INTERPRETER -m pip install --disable-pip-version-check --no-cache-dir --user pipx 2>&1
		/tmp/pip-tmp/bin/pipx install --pip-args=--no-cache-dir pipx
		pipx_bin=/tmp/pip-tmp/bin/pipx

		updaterc "export PIPX_HOME=\"${PIPX_HOME}\""
		updaterc "export PIPX_BIN_DIR=\"${PIPX_BIN_DIR}\""
		updaterc "if [[ \"\${PATH}\" != *\"\${PIPX_BIN_DIR}\"* ]]; then export PATH=\"\${PATH}:\${PIPX_BIN_DIR}\"; fi"

	else
		pipx_bin="$INTERPRETER -m pipx"
	fi

	if [ "$(${pipx_bin} list --short | grep "$PACKAGE")" != "" ]; then
		echo "$PACKAGE  already exists - skipping installation"
	else
		if [ "$VERSION" = "latest" ]; then
			pipx_installation="$PACKAGE"
		else
			pipx_installation="$PACKAGE==$VERSION"
		fi

		include_deps_cmd=$(if [[ $INCLUDEDEPS == "true" ]]; then echo --include-deps; fi)
		# install main package
		${pipx_bin} install --pip-args '--no-cache-dir --force-reinstall' -f "$pipx_installation" $include_deps_cmd

		# install injections (if provided)
		injections_array=($INJECTIONS)
		injections_array_length="${#injections_array[@]}"

		for ((i = 0; i < ${injections_array_length}; i++)); do
			${pipx_bin} inject "$PACKAGE" --pip-args '--no-cache-dir --force-reinstall' -f "${injections_array[$i]}"
		done

		# cleaning pipx to save disk space
		rm -rf /tmp/pip-tmp
	fi
}

install_via_pipx "$INTERPRETER" "$PACKAGE" "$VERSION" "$INJECTIONS" "$INCLUDEDEPS"
