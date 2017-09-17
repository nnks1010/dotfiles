#!/bin/bash

ls

files=`find ./etc -maxdepth 1 -mindepth 1`
for file in $files; do
    echo $file
done
