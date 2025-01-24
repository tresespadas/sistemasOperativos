#!/bin/env bash

read -p "Introduce una variable con espacios: " var

array=$(find / -name "$var" 2>/dev/null)
# echo "$array"

IFS=$'\n'
for file in "$array"; do
  echo "$file"
done
