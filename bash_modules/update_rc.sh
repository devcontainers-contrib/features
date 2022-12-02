#shellcheck shell=bash
update_rc() {
    # The *"..."* asterisk syntax is Bash syntax for "matches".
    # https://superuser.com/a/1582420
    #
    #   [[ $o == *"o"* ]] tests if the string contained in the variable $o
    #   matches the pattern *o* (i.e. if the contents of $o contains an o)
    #
    # The -e argument to echo makes it interpret \r\n\t escape sequences.
    # https://cheat.sh/echo
    #
    # Why /etc/* stuff instead of ~/.bashrc? I don't really know. All I know is
    # that the official devcontainer installation of Node.js does it this way,
    # so I assume it's the right way to do it.
    # https://github.com/devcontainers/features/blob/main/src/node/install.sh#L54

    echo "Adding '$1' to /etc/bash.bashrc ..."
    if [[ "$(cat /etc/bash.bashrc)" != *"$1"* ]]; then
        echo -e "$1" >> /etc/bash.bashrc
    fi
    
    echo "Adding '$1' to /etc/zsh/zshrc ..."
    if [[ -f /etc/zsh/zshrc ]] && [[ "$(cat /etc/zsh/zshrc)" != *"$1"* ]]; then
        echo -e "$1" >> /etc/zsh/zshrc
    fi
}
