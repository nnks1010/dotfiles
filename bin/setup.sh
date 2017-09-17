#!/bin/bash
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
