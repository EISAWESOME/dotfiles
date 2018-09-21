#!/bin/bash



if [ -z "$1"]
  then
    echo "Usage : ./vscode.sh <vscode executable>"
    exit 1
  else
    if [ hash $1 ]
        then
            dir=`dirname $0`
            echo "Backing up vscode extensions"
            echo "-------------------------"

            printf "Backing up existing file ..."
            cp $dir/installed-extension.bak $dir/installed-extension.old.bak
            printf " Done! \n"
            printf "Importing user extensions ..."
            $1 --list-extensions > $dir/installed-extension.bak
            printf " Done !\n\n"
        else 
            echo "$1 not found"
    fi
fi
