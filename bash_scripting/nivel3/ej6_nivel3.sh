#!/bin/bash

read -p "dir: " dir

ruta_dir=$(find / -type d -name "$dir" 2>/dev/null | grep "$dir")
lista_txt=($(ls -R "$ruta_dir" | grep -E ".*\.txt$"))

rutas_finales=()

for i in "${lista_txt[@]}"; do
  rutas_finales+=($(find "$ruta_dir" -type f -name "$i" 2>/dev/null))
done

if [ ! -d "ArchivosTXT" ]; then
  mkdir "ArchivosTXT"
fi
for ((i=0; i<${#rutas_finales[@]};i++)); do
  mv "${rutas_finales[$i]}" ArchivosTXT
done
