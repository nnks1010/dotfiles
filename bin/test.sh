#!/bin/bash

set -eu

if uname | fgrep -i Darwin > /dev/null 2>&1; then
    echo "install brew"
    set -x
    if ! type -p brew > /dev/null 2>&1; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew update
    set +x
else
    echo "update apt"
    set -x
    sudo apt-get update -y
    set +x
fi
