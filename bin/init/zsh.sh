#!/bin/bash

set -x

if uname | fgrep -i Darwin > /dev/null 2>&1; then
    if ! type -p /usr/local/bin/zsh > /dev/null 2>&1; then
        echo "Error: not found zshell"
        exit 1
    else
        sudo echo "/usr/local/bin/zsh" >> etc/shells
        ln -s .zshrc $HOME/dotfiles/etc/.zshrc
        sudo chsh -s /usr/local/bin/zsh
        exec -l $SHELL
    fi
else
    if ! type -p /usr/bin/zsh > /dev/null 2>&1; then
        echo "Error: not found zshell"
        exit 1
    else
        sudo echo "/usr/bin/zsh" >> etc/shells
        ln -s .zshrc $HOME/dotfiles/etc/.zshrc
        sudo chsh -s /usr/bin/zsh
        exec -l $SHELL
    fi
fi

set +x
