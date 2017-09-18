#!/bin/bash

set -x

sudo apt install bzip2 -y
sudo apt install sl -y
sudo apt install zsh -y

# install neovim
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update -y
sudo apt install neovim -y

set +x
