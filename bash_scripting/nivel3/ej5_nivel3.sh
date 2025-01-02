#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Introduce dos cadenas (strings) como parámetros"
  exit 1
fi

if [[ "${#1}" != "${#2}" ]]; then
  echo "Las cadenas no son iguales"
  exit 2
fi

for ((i=0; i<${#1}; i++)); do
  if [[ "${1:i:1}" == "${2:i:1}" ]]; then # ${variable:indice:cuantos caracteres quieres}
    continue
  else
    echo "Las cadenas no son iguales"
    exit 2
  fi
done
echo "Las cadenas son iguales"
