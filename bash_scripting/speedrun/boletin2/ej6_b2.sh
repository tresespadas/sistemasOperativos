#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Especifica dos argumento"
  exit 1
fi

origen="$1"
destino="$2"

origen_path=$(find / -name $origen -type f 2>/dev/null)
if [ -z "$origen_path" ]; then
  echo "No existe el archivo $origen en el sistema"
  exit 2
else
  destino_path=$(find)
  echo -e "El fichero $origen existe.\nCopiándo en $destino"
fi

