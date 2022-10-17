#!/bin/bash

function get_info()
{
    bash info.sh
}

info=$(get_info)

echo "$info"

echo 'Would you like to write this data to a file? (Y/N)'
echo "'Y' or 'y' - yes, anything else - no"

read my_answer

if [[ $my_answer == 'Y' || $my_answer == 'y' ]] ; then
    filename=$(date +'%d_%m_%y_%H_%M_%S')'.status'
    echo "$info" > $filename
    echo 'file '$filename' is created'
fi