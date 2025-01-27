#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Especifica un parámetro"
  exit 1
fi

otorgar_permisos(){
  file_path=$(find / -type f -name "$1" 2>/dev/null)
  if [ -z "$file_path" ]; then
    echo "ERROR: El fichero no existe"
    exit 1
  else
    sudo chmod 777 "$1"
  fi
}

otorgar_permisos "$1"
