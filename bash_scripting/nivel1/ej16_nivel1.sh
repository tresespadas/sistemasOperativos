#!/bin/bash

read -p "num1: " num1
read -p "num2: " num2

if [[ "$num1" -gt "$num2" ]]; then
  for((i=0;i<"$num1";i++)); do
    echo "*"
  done
else
  for ((i = 0; i < "$num2"; i++)); do
    echo "*"
  done
fi
