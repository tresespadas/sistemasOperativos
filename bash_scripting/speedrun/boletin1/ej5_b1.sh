#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Especifica dos parámetros"
  exit 1
else
  if [[ ! $1 =~ [0-9]+$ ]]; then
    echo "$1 no es un número"
    exit 1
  fi
  if [[ ! $2 =~ [0-9]+$ ]]; then
    echo "$2 no es un número"
    exit 1
  fi
fi

if [ $1 -eq $2 ]; then
  echo "Ambos números son iguales"
elif [ $1 -gt $2 ]; then
  echo "$1 es mayor que $2"
else
  echo "$1 es menor que $2"
fi
