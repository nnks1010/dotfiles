#!/bin/bash

echo "setup symbolic link"
set -x

cd etc/
PWD=`pwd`
for file in .??*
do
    if [ -d $file ] && [ -e $HOME/$file ]; then
        echo "directory already exists"
        mv $HOME/$file $HOME/${file}.swp
    fi
    ln -sf $PWD/$file $HOME/$file
done
cd ../

set +x

echo "update package"
set -x

if uname | fgrep -i Darwin > /dev/null 2>&1; then
    brew update
    brew upgrade
    brew cleanup -n
    brew doctor
else
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt autoremove
    sudo apt autoclean
fi

set +x

echo "update anyenv"
set -x

anyenv update

set +x
