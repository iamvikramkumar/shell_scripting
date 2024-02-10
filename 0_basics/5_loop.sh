#!/bin/bash

for((i=0; i < 10; i++))
do
echo "$i"
done


# For iterating of files 
# Below code gives you all files available in the folder
# for FILE in *
# do 
# echo  $FILE
# done


# Below code only gives text files
for FILE in *.txt
do 
echo  $FILE
done
