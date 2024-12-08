#!/bin/bash

dir=$(find / -type d -name "$1" 2>/dev/null)
if [ -z "$dir" ]; then
  echo "El directorio especificado no existe"
  exit 1
fi

echo "$(ls -l "$dir" | awk '$1 ~ /^.r/ {print $NF}')" > listaFicheros # El campo 1 matchee con (empezar por cualquiera y una "r")
