#!/bin/bash

set -eu

if uname | fgrep -i Darwin > /dev/null 2>&1; then
    echo "install brew"
    set -x
    if ! [ -z $TRAVIS ]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
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

echo "install repository"
set -x

cd ~/
if [ ! -d dotfiles ]; then
    git clone https://github.com/nnks1010/dotfiles.git
fi
cd dotfiles

set +x

echo "install package"

if uname | fgrep -i Darwin > /dev/null 2>&1; then
    bash ./bin/init/brew.sh
else
    bash ./bin/init/apt.sh
fi
