#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Especifica un argumento"
  exit 1
fi

funcion1(){
  dir_path=$(find / -type d -name "$1" 2>/dev/null)
  if [ -z "$dir_path" ]; then
    echo "No existe el directorio $dir_path en el sistema"
    exit 1
  fi
  ls -lah "$dir_path"
  echo
  ls -l "${dir_path%/*}" | grep "$1"
}

funcion1 $1
