#!/usr/bin/env bash
set -ex

PACKAGE=${PACKAGE:-""}
VERSION=${VERSION:-"latest"}
INSTALLATION_FLAGS=${INSTALLATION_FLAGS:-""}

if [ -z "$PACKAGE" ]; then
	echo -e "'package' variable is empty, skipping"
	exit 0
fi

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as 
    root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}


ensure_featmake () {
    if ! type featmake > /dev/null 2>&1; then
        temp_dir=/tmp/featmake-download
        mkdir -p $temp_dir
		# download featmake and its checksums file
        curl -sSL -o $temp_dir/featmake https://github.com/devcontainers-contrib/cli/releases/download/v0.0.19/featmake 
        curl -sSL -o $temp_dir/checksums.txt https://github.com/devcontainers-contrib/cli/releases/download/v0.0.19/checksums.txt
		# perform checksum 
        (cd $temp_dir ; sha256sum --check --strict $temp_dir/checksums.txt)
		# move to /usr/local/bin in order to include in PATH
        chmod a+x $temp_dir/featmake
        mv -f $temp_dir/featmake /usr/local/bin/featmake
		# clean up
        rm -rf $temp_dir
    fi
}


install_via_homebrew() {
	package=$1
	version=$2
	installation_flags=$3

	# install Homebrew if does not exists
	if ! type brew >/dev/null 2>&1; then
		echo "Installing Homebrew..."
		ensure_featmake
		brew_prefix="/home/linuxbrew/.linuxbrew"
		featmake "ghcr.io/meaningful-ooo/devcontainer-features/homebrew:2.0.1" -SHALLOW_CLONE "true" -UPDATE_RC "true" -BREW_PREFIX $brew_prefix 
		if [[ "${PATH}" != "*${brew_prefix}/bin*" ]]; then export PATH="${brew_prefix}/bin:${PATH}"; fi
		if [[ "${PATH}" != "*${brew_prefix}/sbin*" ]]; then export PATH="${brew_prefix}/sbin:${PATH}"; fi
	fi
	
	# Solves CVE-2022-24767 mitigation in Git >2.35.2 
	# For more information: https://github.blog/2022-04-12-git-security-vulnerability-announced/
	git config --global --add safe.directory "$(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"


	if [ "$version" = "latest" ]; then
		package_full="$package"
	else
		package_full="${package}@${version}"
	fi

	if brew desc --eval-all --formulae "$package_full"; then
		# If a version is exists then install it the regular way
		brew install $installation_flags --overwrite "$package_full" 
	else
		# unshallow and extract as last resort
		git -C "$(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core" fetch --unshallow
		brew extract --force --version="$version" "$package" homebrew/cask
		
		# "--overwrite" in order to not fail when a similarly named binary is already linked
		brew install $installation_flags --overwrite "$package_full"  
		
		# attempt to remove tap in order to save disk space
		set +e
		brew untap homebrew/cask --force
		set -e
	fi

    brew link --overwrite --force "$package_full" 
}

install_via_homebrew "$PACKAGE" "$VERSION" "$INSTALLATION_FLAGS" 
