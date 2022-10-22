#!/bin/bash

input=$1
length=${#input}

if [[ $length -gt 3 ]] ; then
    dot=${input:0:$length-3}'.'${input:$length-3:2}
elif [[ $length -gt 2 ]] ; then
    dot='0.'${input:0:$length-1}
elif [[ $length -gt 1 ]] ; then
    dot='0.0'${input:0:$length-1}
else
    dot='0.00'
fi

result=$dot' MB'

echo $result