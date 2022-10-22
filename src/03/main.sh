#!/bin/bash

if [[ $1 -eq $2 ]] ; then
    echo 'Name background color and name font color are matching!'
    echo 'Run this script again with different colors!'
    exit 1
fi

if [[ $3 -eq $4 ]] ; then
    echo 'Name background color and name font color are matching!'
    echo 'Run this script again with different colors!'
    exit 1
fi


function get_info()
{
    bash info.sh $1 $2 $3 $4
}

info=$(get_info $1 $2 $3 $4)

echo "$info"