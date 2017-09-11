#!/bin/bash

cwd=`dirname $0`

for package in `cat $cwd/../packages/apt.packages`; do
    sudo apt-get install "${package}" -y
done
