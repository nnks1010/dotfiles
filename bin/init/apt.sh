#!/bin/bash

set -x

sudo apt-get install sl -y
sudo apt-get install zsh -y

# install neovim
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update -y
sudo apt-get install neovim -y

set +x
