#!/bin/bash

if [[ $# -ne 2 ]]; then  # Comprobación de que son dos parámetros
  echo "Necesito dos números como parámetros"
  exit 1
elif [[ ! "$1" =~ ^-?[0-9]+$ ]]; then  # Comprobación de que son números
  echo "El parámetro $1 no es un número"
  exit 1
elif [[ ! "$2" =~ ^-?[0-9]+$ ]]; then
  echo "El parámetro $2 no es un número"
  exit 1
elif [[ "$1" -eq "$2" ]]; then 
  echo "Ambos números son iguales"
elif [[ "$1" -gt "$2" ]]; then
  echo "El número $1 es mayor que el número $2"
elif [[ "$1" -lt "$2" ]]; then
  echo "El número $2 es mayor que el número $1"
fi
