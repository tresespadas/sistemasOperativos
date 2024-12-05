#!/bin/bash

read -p "Elige un número: " num1
read -p "Elige otro número: " num2

if [[ ! "$num1" =~ ^-?[0-9]+$ ]]; then
  echo "$num1 no es un número"
  exit 1
elif [[ ! "$num2" =~ ^-?[0-9]+$ ]]; then
  echo "$num2 no es un número"
  exit 1
elif [[ "$num1" -eq "$num2" ]]; then 
  echo "Ambos números son iguales"
elif [[ "$num1" -gt "$num2" ]]; then
  echo "El número $num1 es mayor que el número $num2"
elif [[ "$num1" -lt "$num2" ]]; then
  echo "El número $num2 es mayor que el número $num1"
fi
