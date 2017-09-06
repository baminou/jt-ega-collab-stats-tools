#!/bin/bash

for folder in $@
do
    if [ ! -d $folder ]
    then
        echo "Error: Folder $folder does not exist or is not a folder"
        exit 64
    fi
done
