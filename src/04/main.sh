#!/bin/bash

colors_file='colors.conf'
colors_file_defaults='colors_defaults.conf'

#taking colors from colors.conf file and colors_default.conf file
colors=`awk '{a = a " " $1} END { print a }' $colors_file`
colors_defaults=`awk '{a = a " " $1} END { print a }' $colors_file_defaults`

colors_array=($colors)
colors_array_defaults=($colors_defaults)


#seeking colors and substituting on default if not found
#column1_background
if [[ ${colors_array[0]} =~ 'column1_background=' ]] ; then
    string=${colors_array[0]}
elif [[ ${colors_array[1]} =~ 'column1_background=' ]] ; then
    string=${colors_array[1]}
elif [[ ${colors_array[2]} =~ 'column1_background=' ]] ; then
    string=${colors_array[2]}
elif [[ ${colors_array[3]} =~ 'column1_background=' ]] ; then
    string=${colors_array[3]}
else 
    string=${colors_array_defaults[0]}
    nbc_default='true'
    echo 'column1_background not found'
fi
name_background_color=${string:19:1}


#column1_font_color
if [[ ${colors_array[0]} =~ 'column1_font_color=' ]] ; then
    string=${colors_array[0]}
elif [[ ${colors_array[1]} =~ 'column1_font_color=' ]] ; then
    string=${colors_array[1]}
elif [[ ${colors_array[2]} =~ 'column1_font_color=' ]] ; then
    string=${colors_array[2]}
elif [[ ${colors_array[3]} =~ 'column1_font_color=' ]] ; then
    string=${colors_array[3]}
else 
    string=${colors_array_defaults[1]}
    nfc_default='true'
fi
name_font_color=${string:19:1}


#column2_background
if [[ ${colors_array[0]} =~ 'column2_background=' ]] ; then
    string=${colors_array[0]}
elif [[ ${colors_array[1]} =~ 'column2_background=' ]] ; then
    string=${colors_array[1]}
elif [[ ${colors_array[2]} =~ 'column2_background=' ]] ; then
    string=${colors_array[2]}
elif [[ ${colors_array[3]} =~ 'column2_background=' ]] ; then
    string=${colors_array[3]}
else 
    string=${colors_array_defaults[2]}
    vbc_default='true'
fi
value_background_color=${string:19:1}


#column2_font_color
if [[ ${colors_array[0]} =~ 'column2_font_color=' ]] ; then
    string=${colors_array[0]}
elif [[ ${colors_array[1]} =~ 'column2_font_color=' ]] ; then
    string=${colors_array[1]}
elif [[ ${colors_array[2]} =~ 'column2_font_color=' ]] ; then
    string=${colors_array[2]}
elif [[ ${colors_array[3]} =~ 'column2_font_color=' ]] ; then
    string=${colors_array[3]}
else 
    string=${colors_array_defaults[3]}
    vfc_default='true'
fi
value_font_color=${string:19:1}



#check if font and background colors are the same
if [[ $name_background_color -eq $name_font_color ]] ; then
    echo 'Name background color and name font color are matching!'
    echo 'Change '$colors_file' or '$colors_file_defaults' to have different colors!'
    exit 1
fi

if [[ $value_background_color -eq $value_font_color ]] ; then
    echo 'Name background color and name font color are matching!'
    echo 'Change '$colors_file' or '$colors_file_defaults' to have different colors!'
    exit 1
fi

#output colored info
function get_info()
{
    bash info.sh $1 $2 $3 $4
}

info=$(get_info $name_background_color $name_font_color $value_background_color $value_font_color)
echo "$info"


#output color scheme
function get_color_name()
{
    color_number=$1
    if [[ $color_number -eq 1 ]] ; then
        echo 'white'
    elif [[ $color_number -eq 2 ]] ; then
        echo 'red'
    elif [[ $color_number -eq 3 ]] ; then
        echo 'green'
    elif [[ $color_number -eq 4 ]] ; then
        echo 'blue'
    elif [[ $color_number -eq 5 ]] ; then
        echo 'purple'
    elif [[ $color_number -eq 6 ]] ; then
        echo 'black'
    fi
}

echo
echo -n 'Column 1 background = '
if [[ $nbc_default == 'true' ]] ; then
    echo -n 'default '
else
    echo -n $name_background_color' '
fi
echo '('$(get_color_name $name_background_color)')'

echo -n 'Column 1 font color = '
if [[ $nfc_default == 'true' ]] ; then
    echo -n 'default '
else
    echo -n $name_font_color' '
fi
echo '('$(get_color_name $name_font_color)')'

echo -n 'Column 2 background = '
if [[ $vbc_default == 'true' ]] ; then
    echo -n 'default '
else
    echo -n $value_background_color' '
fi
echo '('$(get_color_name $value_background_color)')'

echo -n 'Column 2 font color = '
if [[ $vfc_default == 'true' ]] ; then
    echo -n 'default '
else
    echo -n $value_font_color' '
fi
echo '('$(get_color_name $value_font_color)')'
