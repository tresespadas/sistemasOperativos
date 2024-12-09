#!/bin/bash

if [ "$#" -ne 1 ] || [[ ! "$1" =~ ^[0-9]$|^10$ ]]; then
  echo "Necesito un número del 0 al 10"
  exit 1
fi

echo "Tabla de multiplicar del $1" 
echo "---------------------------"
for i in $(seq 0 1 10); do
  echo "$1 * $i = $(( $1 * $i))"
done
