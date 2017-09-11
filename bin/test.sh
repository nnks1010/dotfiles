#!/bin/bash

set -eu

if uname | fgrep -i Darwin > /dev/null 2>&1; then
    echo "install brew"
    set -x
    if ! [ -z $TRAVIS ]; then
        rm -rf /usr/local/Homebrew
    fi
    if ! type -p brew > /dev/null 2>&1; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew update
    set +x

    echo "install git"
    set -x
    brew install git
    set +x
else
    echo "update apt"
    set -x
    sudo apt-get update -y
    set +x

    echo "install git"
    set -x
    sudo apt-get install git -y
    set +x
fi
