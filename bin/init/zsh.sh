#!/bin/bash

set -x

ln -s .zshrc ~/dotfiles/etc/.zshrc
chsh -s /bin/zsh

set +x
