#!/usr/bin/env bash

if [[ "$#" -lt 2 ]]; then
  echo "Este script requiere de un directorio como primero parametro y otros ficheros" &>2
  exit 1
fi

dir_path=$(find /home/ -type d -name "$1" 2>/dev/null)
if [[ -z "$dir_path" ]]; then
  echo "El directorio no se encuentra en el sistema" &>2
  exit 2
fi

shift
for file in "$@"; do
  file_path=$(find /home/ -type f -name "$file" 2>/dev/null | head -n 1)
  if [[ -f "$file_path" ]]; then 
    continue
  else
    echo "$file no es un fichero. Abortando la copia..."
    exit 3
  fi
done

for file in "$@"; do
  file_path=$(find /home/ -type f -name "$file" 2>/dev/null | head -n 1)
  cp -v $file_path $dir_path
done
