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
    brew prune
    brew doctor
    set +x

    echo "install git"
    set -x
    brew install git
    set +x
else
    echo "update apt"
    set -x
    sudo apt update -y
    set +x

    echo "install git"
    set -x
    sudo apt install git -y
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

echo "install anyenv"
set -x

git clone https://github.com/riywo/anyenv ~/.anyenv
ln -sf $HOME/dotfiles/etc/.bashrc $HOME/.bashrc
source $HOME/.bashrc
anyenv install rbenv
anyenv install pyenv
anyenv install goenv
anyenv install nodenv
source $HOME/.bashrc
rbenv install 2.4.1
pyenv install 3.6.0
pyenv install 2.7.13
goenv install 1.8
nodenv install 8.1.0

set +u
rbenv global 2.4.1
pyenv global 3.6.0 2.7.13
set -u

mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

set +x

echo "install rust"
set -x

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
source $HOME/.bashrc
rustup install beta
rustup install nightly

set +x

echo "init zsh"

bash ./bin/init/zsh.sh

echo "init neovim"
set -x

pip2 install neovim
pip3 install neovim
gem install neovim

set +x

echo "setup"

bash ./bin/setup.sh

