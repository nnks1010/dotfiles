#!/bin/bash
set -x

cd etc/
PWD=`pwd`
for file in .??*
do
    if [ -d $file ] && [ -e $HOME/$file ]; then
        echo $file
        rm -rf $HOME/$file
    fi
    ln -sf $PWD/$file $HOME/$file
done
cd ../

set +x
