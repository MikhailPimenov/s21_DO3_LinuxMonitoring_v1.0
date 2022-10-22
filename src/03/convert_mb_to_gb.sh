#!/bin/bash

input=$1
length=${#input}

if [[ $length -gt 3 ]] ; then
    dot=${input:0:$length-3}'.'${input:$length-3:3}
elif [[ $length -gt 2 ]] ; then
    dot='0.'$input
elif [[ $length -gt 1 ]] ; then
    dot='0.0'$input
elif [[ $length -gt 0 ]] ; then
    dot='0.00'$input
fi

result=$dot' GB'

echo $result