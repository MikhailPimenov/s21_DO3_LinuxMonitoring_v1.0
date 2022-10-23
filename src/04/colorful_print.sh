#!/bin/bash

name_background_number=$1
name_font_number=$2

value_background_number=$3
value_font_number=$4

name=$5

shift 5
value="$*"


black_font="\e[1;30m"
red_font="\e[1;31m"
green_font="\e[1;32m"
yellow_font="\e[1;33m"
blue_font="\e[1;34m"
purple_font="\e[1;35m"
white_font="\e[1;37m"

black_background="\e[1;40m"
red_background="\e[1;41m"
green_background="\e[1;42m"
yellow_background="\e[1;43m"
blue_background="\e[1;44m"
purple_background="\e[1;45m"
white_background="\e[1;47m"

function get_background_color()
{
    input=$1
    if [[ $input -eq 1 ]] ; then
        echo $white_background
    elif [[ $input -eq 2 ]] ; then
        echo $red_background
    elif [[ $input -eq 3 ]] ; then
        echo $green_background
    elif [[ $input -eq 4 ]] ; then
        echo $blue_background
    elif [[ $input -eq 5 ]] ; then
        echo $purple_background
    elif [[ $input -eq 6 ]] ; then
        echo $black_background
    fi
}

function get_font_color()
{
    input=$1
    if [[ $input -eq 1 ]] ; then
        echo $white_font
    elif [[ $input -eq 2 ]] ; then
        echo $red_font
    elif [[ $input -eq 3 ]] ; then
        echo $green_font
    elif [[ $input -eq 4 ]] ; then
        echo $blue_font
    elif [[ $input -eq 5 ]] ; then
        echo $purple_font
    elif [[ $input -eq 6 ]] ; then
        echo $black_font
    fi
}

name_background=$(get_background_color $name_background_number)
name_font=$(get_font_color $name_font_number)

value_background=$(get_background_color $value_background_number)
value_font=$(get_font_color $value_font_number)


function set_colors()
{
    background=$1
    font=$2
    echo "${background}${font}"
}

function set_name_colors()
{
    echo $(set_colors $name_background $name_font)
}
function set_value_colors()
{
    echo $(set_colors $value_background $value_font)
}
function reset_colors()
{
    echo $(set_colors $black_background $white_font)
}

echo -e "$(set_name_colors)"$name"$(reset_colors) = $(set_value_colors)"$value"$(reset_colors)"
