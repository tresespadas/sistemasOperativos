#!/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Sólo admito un parámetro"
  exit 1
fi

#input=$(find / -regex ".*$1.*" 2>/dev/null) # Si quieres matchear por regex
input=$(find / -name "$1" 2>/dev/null) # Lo meto en un array por si encuentra varios

if [ -z "$input" ]; then
  echo "No se ha encontrado ningún fichero o directorio llamado $1"
  exit 1
fi

for path in $input; do
  if [ -f "$path" ]; then
    echo "Existe un fichero llamadao $1 en $path"
  elif [ -d "$path" ]; then
    echo "Existe un directorio llamado $1 y se encuentra en $path"
  fi
done
