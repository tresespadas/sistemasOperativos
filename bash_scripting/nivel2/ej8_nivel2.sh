#!/bin/bash

if [[ ! $1 =~ ^-?[0-9]+$ ]] || [[ ! $2 =~ ^-?[0-9]+$ ]]; then
  echo "Los argumentos deben ser dos números"
  exit 1
fi

if [ "$1" -gt "$2" ]; then
  echo "'$1' debe ser menor que '$2'"
  exit 2
fi

for i in $(seq $1 1 $2); do
  echo "$i"
done
