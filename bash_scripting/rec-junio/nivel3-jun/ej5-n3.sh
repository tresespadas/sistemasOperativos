#!/bin/env bash

### compara_cadena ###

if [[ "$#" -ne 2 ]]; then
  echo "Introduce dos cadenas de texto como parámetros"
  exit 1
fi

cadena1=("$1")
cadena2=("$2")

if [[ "${#cadena1}" != "${#cadena2}" ]]; then
  echo "Distinta longitud. No son iguales"
  exit 2
fi

for ((i=0; i<${#cadena1}; i++)); do
  if [[ "${cadena1:$i:1}" == "${cadena2:$i:1}" ]]; then
    continue
  else
    echo "${cadena1} y ${cadena2} no son iguales" >&2
    exit 2
  fi
done
echo "${cadena1} y ${cadena2} son iguales"
