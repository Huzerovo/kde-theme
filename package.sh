#!/usr/bin/bash

if [[ -z "$1" ]]; then
    exit 2
fi

_tmp_file="$PWD/package.tar.gz"

tar -zcf "$_tmp_file" "$1" 
kpackagetool5 -i "$_tmp_file" 2> /dev/null || kpackagetool5 -u "$_tmp_file" 2> /dev/null
