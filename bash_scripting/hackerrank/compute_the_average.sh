#!/bin/bash

list=()
while read line; do
  if [[ -z $line ]]; then
    continue
  fi
  list+=($line)
done

sum=0
for i in ${list[@]}; do
  (( sum+=$i ))
done

average=$(echo "scale=3; $sum/${#list[@]}" | bc -l)
echo $average
