#!/bin/bash

set -x

if uname | fgrep -i Darwin > /dev/null 2>&1; then
    if ! type -p /usr/local/bin/zsh > /dev/null 2>&1; then
        echo "Error: not found zshell"
        exit 1
    else
        sudo echo "/usr/local/bin/zsh" >> etc/shells
        sudo chsh -s /usr/local/bin/zsh
    fi
else
    if ! type -p /usr/bin/zsh > /dev/null 2>&1; then
        echo "Error: not found zshell"
        exit 1
    else
        sudo echo "/usr/bin/zsh" >> etc/shells
        sudo chsh -s /usr/bin/zsh
    fi
fi

set +x
