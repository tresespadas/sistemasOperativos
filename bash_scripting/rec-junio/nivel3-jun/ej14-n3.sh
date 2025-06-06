#!/usr/bin/env bash

### suma_fichero ###

lineas=0
for file in $@; do
  ruta_file=$(find /home/ -type f -name "$file" 2>/dev/null)
  if [[ -z "$ruta_file" ]]; then
    echo "No se encuentra el fichero en el sistema"
  fi
  linea=$(wc -l "$ruta_file" | awk '{print $1}')
  ((lineas+=$linea))
done
echo "Lineas totales de todos los archivos: $lineas"
