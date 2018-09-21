#!/bin/bash

dir=`dirname $0`

if [ -z "$1"]
  then
    echo "Usage : ./vscode.sh <vscode executable>"
    exit 1
  else
    while read -u 10 p; do

    $1 --install-extension $p
    
  done 10<$dir/installed-extension.bak
  exit 0
fi



