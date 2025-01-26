#!/bin/env bash

read -p "Introduce una potencia: " potencia
read -p "Introduce una base: " base

if [[ $potencia =~ ^[0-9]+$ ]]; then # Error al usar potencias negativas
  if [[  $base =~ ^-?[0-9]+$ ]]; then
    echo $(($base**$potencia))
  else
    echo "Especifica un número para la base, porfavor."
    exit 2
  fi
else
  echo "Especifica un número para la potencia, porfavor."
  exit 1
fi
