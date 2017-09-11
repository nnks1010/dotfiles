#!/bin/bash

cwd=`dirname $0`

for package in `cat $cwd/../packages/brew.packages`; do
    brew install "${package}"
done
