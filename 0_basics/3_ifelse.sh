#!/bin/bash
echo "Enter two numbers: "
read num1
read num2

if [ $num1 -eq $num2 ]; then
    echo "Numbers are equal."
else
echo "Numbers are not equal."
fi