#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Especifica un argumento"
  exit 1
fi

listar(){
  dir_path=$(find / -type d -name "$1" 2>/dev/null)
  if [ -z "$dir_path" ]; then
    echo -e "Directorio no encontrado.\nGenerando archivo de errores en /tmp/listar_error"
    echo "ERROR: El directorio $1 no existe en el sistema." > /tmp/listar_error
  else
    ls -lah $dir_path
  fi
}

listar "$1"
