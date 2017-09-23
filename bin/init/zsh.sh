#!/bin/bash

set -x

user=`whoami`

if uname | fgrep -i Darwin > /dev/null 2>&1; then
    if ! type -p /usr/local/bin/zsh > /dev/null 2>&1; then
        echo "Error: not found zshell"
        exit 1
    else
        sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
        sudo chsh -s /usr/local/bin/zsh $user
    fi
else
    if ! type -p /usr/bin/zsh > /dev/null 2>&1; then
        echo "Error: not found zshell"
        exit 1
    else
        sudo sh -c "echo '/usr/bin/zsh' >> /etc/shells"
        sudo chsh -s /usr/bin/zsh $user
    fi
fi

set +x
