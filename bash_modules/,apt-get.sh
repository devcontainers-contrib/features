#shellcheck shell=bash
# This applies the the PROCESS, not this function.
trap 'rm -rf /var/lib/apt/lists/*' SIGINT SIGTERM ERR EXIT

# A wrapper around apt-get install that adds -y, --no-install-recommends, and
# doesn't run if the package is already installed.
function ,apt-get() {
  if [[ $1 == install ]]; then
    # Remove the first argument since "install" is irrelevant now.
    shift

    # This tests if the package(s) are installed on the system. dpkg -s only exits
    # with 0 (clean) if it IS ALREADY INSTALLED. If it's NOT installed, then it
    # will exit 1 (bad). Thus, we inverse that.
    #
    # "If ...args are NOT installed, then..."
    if ! dpkg -s "$@" >/dev/null 2>&1; then

      # The /var/lib/apt/lists/* glob only returns something if apt-get update has
      # already run. We don't want to waste time if it already has.
      #
      # 📚 Further reading: https://serverfault.com/a/449728
      # 📙 Related reading: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
      #
      # The wc -l command just counts the lines. That's it. We want to only run
      # the apt-get update command IF THERE ISN'T ANY PREVIOUS DATA.
      #
      # 📚 Further reading: https://cheat.sh/wc
      if [[ $(find /var/lib/apt/lists/* | wc -l) == 0 ]]; then
        echo "Running apt-get update ..."
        apt-get update -y
      fi
      apt-get install -y --no-install-recommends "$@"
    fi
  else
    apt-get "$@"
  fi
}
