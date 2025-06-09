#!/usr/bin/env bash

if [[ "$#" -gt 1 ]]; then
  echo "Especifica sólo un parámetro (un directorio)"
  exit 1
fi

dir=$(find /home/ -type d -name "$1" 2>/dev/null)
if [[ -z "$dir" ]]; then
  echo "El directorio espeficado no existe en el sistema"
  exit 2
fi

fecha=$(date +"%d-%m-%Y-%H:%M")
file_name="listadeficheros""$fecha"
touch "$file_name"

while IFS= read -r -d '' file; do
  if [[ ! -r "$file" ]]; then
    echo "$file" >> "$file_name"
  fi
done < <(find "$dir" -mindepth 1 -maxdepth 1 -type f -print0 2>/dev/null)
