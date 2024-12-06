#!/bin/bash

read -p "Introduce un número de base: " base
read -p "Introduce un número de exponente: " exp

if [[ $base =~ ^-?[0-9]+$ ]];then
  if [[ $exp =~ ^-?[0-9]+$ ]];then
    echo "$base elevado a $exp es $(($base ** $exp))"
  else
    echo "El exponente no es un número"
    exit 1
  fi
else
  echo "La base no es un número"
  exit 1
fi
