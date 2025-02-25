#!/bin/bash

var=0
temp=1
echo -n "$var "
for((i=0;i<=5;i++)); do
  sum=$(( var+=temp ))
  var=$temp
  temp=$sum
  echo -n "$sum "
done
echo
