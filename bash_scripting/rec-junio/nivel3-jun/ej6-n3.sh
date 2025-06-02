#!/bin/env bash

### buscatxt ###

read -p "Directorio donde buscar los .txt: " dir

dir_path=($(find /home/ -type d -name "$dir" 2>/dev/null))

if [[ -z "$dir_path" ]]; then
  echo "El directorio especificado no existe"
  exit 1
fi

for file in "${dir_path[@]}"; do
  while IFS= read -r -d '' txt; do
    if [[ "$txt" == *.txt ]]; then
      if [[ ! -d "ArchivosTXT" ]]; then
        mkdir "ArchivosTXT"
      fi
      cp "$txt" "ArchivosTXT" 
    fi
  done < <(find "$file" -mindepth 1 -print0 2>/dev/null)
done
