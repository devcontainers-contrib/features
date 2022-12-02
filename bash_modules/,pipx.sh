#shellcheck shell=bash

# A wrapper around pip install that uses pipx and auto-installs Python, pip, and
# pipx if they aren't already installed.
function ,pipx() {
  command -v pipx || install_python
  pipx "$@"
}

function install_python() {
  source bash_modules/,curl.sh

  local PYTHON_FEATURE_DIR
  PYTHON_FEATURE_DIR=$(mktemp -d)
  ,curl -fsSLo "$PYTHON_FEATURE_DIR/install.sh" https://github.com/devcontainers/features/raw/46dfa11ecd3c507187eebbd6784c09d736737255/src/python/install.sh
  (
    cd "$PYTHON_FEATURE_DIR" || return 1
    chmod +x install.sh
    "$PYTHON_FEATURE_DIR/install.sh"
  )
  rm -rf "$PYTHON_FEATURE_DIR"
}
