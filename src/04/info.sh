#!/bin/bash


bash colorful_print.sh $1 $2 $3 $4 'HOSTNAME' $HOSTNAME


TIMEZONE=$(timedatectl | grep zone)
bash colorful_print.sh $1 $2 $3 $4 'TIMEZONE' $TIMEZONE


bash colorful_print.sh $1 $2 $3 $4 'USER' $USER


OS_long=$(cat /etc/issue)
array=($OS_long)
OS="${array[@]:0:3}"
bash colorful_print.sh $1 $2 $3 $4 'OS' $OS


DATE=$(date +"%d %b %Y %H:%M:%S")
bash colorful_print.sh $1 $2 $3 $4 'DATE' $DATE


UPTIME=$(uptime -p)
bash colorful_print.sh $1 $2 $3 $4 'UPTIME' $UPTIME


UPTIME_SEC=$(awk '{ print $1 }' /proc/uptime)
bash colorful_print.sh $1 $2 $3 $4 'UPTIME_SEC' $UPTIME_SEC


IP=$(hostname -I)
bash colorful_print.sh $1 $2 $3 $4 'IP' $UPTIME_SEC


MASK=$(ip a | grep inet | grep brd | awk '{ print $4 }')
bash colorful_print.sh $1 $2 $3 $4 'MASK' $MASK


GATEWAY=$(ip route | grep default | awk '{ print $3 }')
bash colorful_print.sh $1 $2 $3 $4 'GATEWAY' $GATEWAY



ram_total=$(free -t -m | grep Total: | awk '{ print $2 }')
ram_used=$(free -t -m | grep Total: | awk '{ print $3 }')
ram_free=$(free -t -m | grep Total: | awk '{ print $4 }')

function my_convert_gb()
{
    bash convert_mb_to_gb.sh $1    
}

RAM_TOTAL=$(my_convert_gb $ram_total)
RAM_USED=$(my_convert_gb $ram_used)
RAM_FREE=$(my_convert_gb $ram_free)

bash colorful_print.sh $1 $2 $3 $4 'RAM_TOTAL' $RAM_TOTAL
bash colorful_print.sh $1 $2 $3 $4 'RAM_USED' $RAM_USED
bash colorful_print.sh $1 $2 $3 $4 'RAM_FREE' $RAM_FREE



space_root=$(df -k | grep ubuntu | awk '{ print $2 }')
space_root_used=$(df -k | grep ubuntu | awk '{ print $3 }')
space_root_free=$(df -k | grep ubuntu | awk '{ print $4 }')

function my_convert_mb()
{
    bash convert_kb_to_mb.sh $1
}

SPACE_ROOT=$(my_convert_mb $space_root)
SPACE_ROOT_USED=$(my_convert_mb $space_root_used)
SPACE_ROOT_FREE=$(my_convert_mb $space_root_free)

bash colorful_print.sh $1 $2 $3 $4 'SPACE_ROOT' $SPACE_ROOT
bash colorful_print.sh $1 $2 $3 $4 'SPACE_ROOT_USED' $SPACE_ROOT_USED
bash colorful_print.sh $1 $2 $3 $4 'SPACE_ROOT_FREE' $SPACE_ROOT_FREE
