#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Se necesitan dos argumentos"
  exit 1
fi

ruta_file=$(find / -type f -name "$1" 2>/dev/null)
if [ -z "$ruta_file" ]; then
  echo "El fichero no existe"
  exit 2
fi

if [ -e "$2" ]; then
  echo "Ya existe un archivo con el mismo nombre. ¿Sobreescribir? [s/n]"
  read respuesta
  if [ "$respuesta" == "S" ]; then
      cp $ruta_file "$2"
      exit 0
  fi
else
  echo "El fichero existe. Copiando el archivo '$1' en $(pwd) con el nombre '$2'"
  cp "$ruta_file" "$2"
  exit 0
fi
