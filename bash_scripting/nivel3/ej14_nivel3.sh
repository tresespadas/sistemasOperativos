#!/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Especifica sólo un parámetro, por favor."
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "El archivo no se encuentra en la carpeta $(pwd)"
  echo "Buscando en la raíz del sistema..."
  file=$(find / -type f -name "$1" 2>/dev/null)
  if [ ! -f "$file" ]; then
    echo "Archivo inexistente"
    exit 2
  else
    echo "Empleando el archivo $file"
  fi
else
  file=$1
fi

suma=0

while IFS= read -r linea; do
  numero=$(echo "$linea" | tr -cd '0-9') # No se tienen en cuenta los números negativos
  # numero=$(echo "$linea" | tr -cd '0-9-') # Se tienen en cuenta numeros negativos pero con el signo pegado. Ejemplo: aaaa-1 significa -1
  suma=$((suma + numero))
done < "$file"

file_name=$(echo "$file" | awk -F "/" '{print $NF}')
echo "La suma de todos los números del archivo $file_name es $suma"
