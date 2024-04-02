
#!/bin/bash

##########################
# Author : Vikram
# Date : 02-04-24
#
# This is a basic Digital Clock project based on shell script
#
# Version : v1
###########################


#create color palette
Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'

while true
do
clear
echo $Blue $(date +%T)
sleep 1s 
done
