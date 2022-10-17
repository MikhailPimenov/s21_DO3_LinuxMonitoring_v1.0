#!/bin/bash

echo 'HOSTNAME = '$HOSTNAME
tz=$(timedatectl | grep zone)
echo 'TIMEZONE = '$tz
echo 'USER = '$USER
echo 'OS = '$(cat /etc/issue)
echo 'DATE = '$(date +"%d %b %Y %H:%M:%S")
echo 'UPTIME = '$(uptime -p)
echo 'UPTIME_SEC = '$(awk '{ print $1 }' /proc/uptime)
echo 'IP = '$(hostname -I)
echo 'MASK = '$(ip a | grep inet | grep brd | awk '{ print $4 }')
echo 'GATEWAY = '$(ip rout | grep default | awk '{ print $3 }')

ram_total=$(free -t -m | grep Total: | awk '{ print $2 }')
ram_used=$(free -t -m | grep Total: | awk '{ print $3 }')
ram_free=$(free -t -m | grep Total: | awk '{ print $4 }')

function my_convert_gb()
{
    bash convert_mb_to_gb.sh $1    
}

echo 'RAM_TOTAL = '$(my_convert_gb $ram_total)
echo 'RAM_USED = '$(my_convert_gb $ram_used)
echo 'RAM_FREE = '$(my_convert_gb $ram_free)

space_root=$(df -k | grep ubuntu | awk '{ print $2 }')
space_root_used=$(df -k | grep ubuntu | awk '{ print $3 }')
space_root_free=$(df -k | grep ubuntu | awk '{ print $4 }')

function my_convert_mb()
{
    bash convert_kb_to_mb.sh $1
}

echo 'SPACE_ROOT = '$(my_convert_mb $space_root)
echo 'SPACE_ROOT_USED = '$(my_convert_mb $space_root_used)
echo 'SPACE_ROOT_FREE = '$(my_convert_mb $space_root_free)