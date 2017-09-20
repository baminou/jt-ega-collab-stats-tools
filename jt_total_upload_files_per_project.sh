#!/bin/bash

ls $@ | grep -v ega | cut -d'.' -f 3 | sort | grep -v "^$"| uniq -c| sed 's/$/ '$(date +%d\\/%m\\/%Y-%H:%M:%S)'/'
