#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Se precisa un sólo argumento"
  exit 1
fi

file=$(find / -type f -name "$1" 2>/dev/null | head -n 1) # Importante: solo coge la primera entrada
if [ -z "$file" ]; then
  echo "El archivo no existe"
  exit 2
fi

lectura=$(ls -l "$file" | awk '$1 ~ /^.r/ {print $NF}')
if [ -z "$lectura" ]; then
  echo "El archivo no tiene permisos de lectura"
  exit 3
else
  cat "$file"
  exit 0
fi
