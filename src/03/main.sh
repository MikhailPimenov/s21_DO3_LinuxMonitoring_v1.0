#!/bin/bash



if [[ ($1 -ne 1) && ($1 -ne 2) && ($1 -ne 3) && ($1 -ne 4) && ($1 -ne 5) && ($1 -ne 6)]] ; then
    echo 'Not correct input!'
    echo 'Run this script again with exact four numbers 1,2,3,4,5 or 6!'
    exit 1
fi

if [[ ($2 -ne 1) && ($2 -ne 2) && ($2 -ne 3) && ($2 -ne 4) && ($2 -ne 5) && ($2 -ne 6)]] ; then
    echo 'Not correct input!'
    echo 'Run this script again with exact four numbers 1,2,3,4,5 or 6!'
    exit 1
fi

if [[ ($3 -ne 1) && ($3 -ne 2) && ($3 -ne 3) && ($3 -ne 4) && ($3 -ne 5) && ($3 -ne 6)]] ; then
    echo 'Not correct input!'
    echo 'Run this script again with exact four numbers 1,2,3,4,5 or 6!'
    exit 1
fi

if [[ ($4 -ne 1) && ($4 -ne 2) && ($4 -ne 3) && ($4 -ne 4) && ($4 -ne 5) && ($4 -ne 6)]] ; then
    echo 'Not correct input!'
    echo 'Run this script again with exact four numbers 1,2,3,4,5 or 6!'
    exit 1
fi



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