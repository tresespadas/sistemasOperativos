#!/bin/env bash

if [ "$#" -eq 0 ]; then
  echo "Especifique al menos un argumento"
  exit 1
fi

for arg in $@
do 
  file=$(find / -name $arg 2>/dev/null)
  if [ -z $file ]; then
    echo "El fichero/directorio especificado no existe"
  elif [ -d $file ]; then
    size=$(stat --format=%s $file)
    echo "El argumento es un directorio y ocupa $size"
  else
    type=$(stat --format=%F $file)
    echo "El argumento es un fichero de tipo $type"
  fi
done
