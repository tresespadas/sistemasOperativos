#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Especifica los archivos que quieres copiar"
  exit
else
  echo "Comprobando si existe el directorio 'Seguridad'..."
  ruta=$(find / -type d -name "Seguridad" 2>/dev/null)
  if [ -z $ruta ]; then
    echo "El directorio no existe, se procede a crearlo en $(pwd)"
    mkdir Seguridad
    echo "Copiando los archivos..."
    for file in $@; do
      cp $file $(pwd)/Seguridad
    done
  else
    echo "El directorio 'Seguridad' se encuentra en $ruta"
    echo "Copiando los archivos..."
    for file in $@; do
      cp $file $ruta
    done
  fi
fi
