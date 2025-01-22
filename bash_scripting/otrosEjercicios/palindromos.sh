#!/bin/env bash

# Suponemos que el script funciona tal que así: ./palindromo.sh <palabra o frase>

# Le quita los espacios y los convierte a minúsculas
palabra1=$(echo "$@" | tr -d " " | tr 'A-Z' 'a-z')
palabra2=$(echo "$@" | tr -d " " | tr 'A-Z' 'a-z')

for ((i = 0; i < "${#palabra1}"; i++)); do
  for ((j = ${#palabra2}-1-$i; j >= 0; j--)); do
    if [ "${palabra1:$i:1}" != "${palabra2:$j:1}" ]; then
      echo "No es un palíndromo"
      exit 1
    fi
    break
  done
done

echo "La palabra o frase "$@" es un palíndromo"
