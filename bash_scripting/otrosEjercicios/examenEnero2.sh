#!/bin/env bash

## copyfiles.sh ##

if [[ "$#" -eq 0 || "$#" -eq 1 ]]; then
  echo "Especifica un directorio y un(os) archivo(s) que copiar."
  exit 1
fi 

dir_path=$(find / -type d -name "$1" 2>/dev/null)
if [ -z "$dir_path" ]; then
  echo "El directorio especificado no existe."
  exit 1
else
  shift # Para eliminar el directorio del bucle
  for i in "$@"; do
    file_path=$(find / -name "$i" -type f 2>/dev/null)
    if [ -z "$file_path" ]; then
      echo "El archivo '$i' no existe en el sistema."
    else
      dest_path="$dir_path/$i"
      if [ -e "$dest_path" ]; then # Si ya existe el archivo en el directorio lo borra y lo vuelve a copiar
        rm -f "$dest_path"
        file_path=$(find / -name "$i" -type f 2>/dev/null) # ¿Y qué pasa si hay más de uno? REPASAR
        cp -v "$file_path" "$dir_path"
      else
        cp -v "$file_path" "$dir_path"
      fi
    fi
  done
fi
