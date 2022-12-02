#shellcheck shell=bash
add_to_rc() {
    # The *"..."* asterisk syntax is Bash syntax for "matches".
    # https://superuser.com/a/1582420
    #
    #   [[ $o == *"o"* ]] tests if the string contained in the variable $o
    #   matches the pattern *o* (i.e. if the contents of $o contains an o)
    #
    # The -e argument to echo makes it interpret \r\n\t escape sequences.
    # https://cheat.sh/echo

    echo "Updating /etc/bash.bashrc..."
    if [[ "$(cat /etc/bash.bashrc)" != *"$1"* ]]; then
        echo -e "$1" >> /etc/bash.bashrc
    fi
    echo "Updating /etc/zsh/zshrc"
    if [[ -f /etc/zsh/zshrc ]] && [[ "$(cat /etc/zsh/zshrc)" != *"$1"* ]]; then
        echo -e "$1" >> /etc/zsh/zshrc
    fi
}
