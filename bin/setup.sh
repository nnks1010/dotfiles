#!/bin/bash

cd etc/

PWD=`pwd`

for file in .??*
do
    ln -sf $PWD/$file $file
done

cd ../
