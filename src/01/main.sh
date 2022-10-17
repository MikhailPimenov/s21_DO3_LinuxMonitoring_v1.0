#!/bin/bash

input=$1
regex_for_number='^[+-]?[0-9]+([.][0-9]+)?$'

if [[ $input =~ $regex_for_number ]] ; then
    bash output_error.sh
else
    bash output.sh $input
fi
