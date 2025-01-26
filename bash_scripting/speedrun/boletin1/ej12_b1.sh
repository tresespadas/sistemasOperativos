#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Especifica al menos un parámetro"
  exit 1
fi

input=()
for arg in "$@"; do
  while IFS= read -r file; do
    input+=("$file")
  done < <(find / -type f -name $arg 2>/dev/null)
done

for i in ${input[@]}; do
  echo -e "Archivo encontrado: $i\nMostrando su contenido: "
  cat "$i" 2>/dev/null || echo "No se pudo leer el archivo $i"
done
