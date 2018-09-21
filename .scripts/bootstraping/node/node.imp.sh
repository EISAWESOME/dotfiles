#!/bin/sh

if [ hash node && hash npm ]
    then

        dir=`dirname $0`

        echo "Backing up global node_modules"
        echo "-------------------------"

        printf "Backing up existing config ..."
        cp -R $dir/gnode_modules $dir/gnode_modules.old
        printf " Done! \n"

        printf "Saving current config ..."
        npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > $dir/gnode_modules
        printf " Done! \n\n"
    else 
        echo "Node or npm isn't installed !"
fi


