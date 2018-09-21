#!/bin/bash

dir=`dirname $0`

# TODO : Check for node and npm installation

if [ hash node && hash npm ]
    then
        # install globally all modules lister in gnode_modules file
        xargs npm i -g < $dir/gnode_modules
    else 
        echo "Node or npm isn't installed !"
fi
