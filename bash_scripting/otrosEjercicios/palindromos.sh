#!/bin/env bash

# Suponemos que el script funciona tal que así: ./palindromo.sh aca aca

if [ $# -ne 1 ]; then
  echo "Especifica un argumento para comprobar si son palíndromos o no"
  exit 1
fi

palabra1="$1"
palabra2="$1"

for ((i = 0; i < "${#palabra1}"; i++)); do
  for ((j = ${#palabra2}-1-$i; j >= 0; j--)); do
    if [ "${palabra1:$i:1}" != "${palabra2:$j:1}" ]; then
      echo "No es un palíndromo"
      exit 1
    fi
    break
  done
done

echo "La palabra $1 es un palíndromo"
