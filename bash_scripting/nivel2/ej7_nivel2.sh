#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Se precisan dos argumentos"
  exit 1
fi

ruta=$(find / -type f -name "$2" 2>/dev/null)
if [ -z "$ruta" ]; then
  echo "El fichero no existe"
  exit 2
fi

while getopts "l:c:" arg; do
  case $arg in
    l) ls -l $(dirname "$ruta");;
    c) ls $(dirname "$ruta");;
    *) echo "Error en los parámetros."; exit 2;;
  esac
done
