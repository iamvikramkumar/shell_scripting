#!/bin/bash

##########################
# Author : Vikram
# Date : 17-01-24
#
# This script executes output of the node health
#
# Version : v1
###########################

set -x  #debug mode
set -e # exit the script when there is an error
set -o pipefail

#set -exo pipefail --> It's a combination of {set -x, set -e, set -o pipefail}

echo "Print the disk space"
df -h     # for printing disk space

echo "Print the memory"
free -g   # for printing the memory

echo "Print the resources"
nproc     # for printing the resources

# ps -ef --> It provides entire details of process  
#grep --> It filter the output
#awk --> It also filter the output but it gives you a specific columns from the output
ps -ef | grep docker | awk -F" " '{print $2}'