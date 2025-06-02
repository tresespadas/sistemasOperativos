#!/bin/env bash

### cuenta_tipos ###

if [[ "$#" -gt 1 ]]; then
  echo "Especifica sólo un parámetro (un directorio). O en su defecto omítelo para clasificar los ficheros en el directorio actual"
  exit 1
fi

if [[ "$#" -eq 0 ]]; then
  dir_path=("$PWD")
else
  mapfile -t dir_path < <(find /home/ -type d -name "$1" 2>/dev/null)
fi

if [[ "${#dir_path[@]}" -eq 0 ]]; then
  echo "El directorio especificado no existe"
  exit 2
fi

for j in "${dir_path[@]}"; do
  declare -a dirs=() texts=() ejec=()
  echo -e "\nLa clasificación de ficheros del directorio "$j" es:\n"
  while IFS= read -r -d '' i; do
    if [[ -d "$i" ]]; then
      dirs+=($(basename "$i"))
    elif [[ -x "$i" && -f "$i" ]]; then
      ejec+=($(basename "$i"))
    elif [[ -f "$i" ]]; then
      texts+=($(basename "$i"))
    fi
  done < <(find "$j" -maxdepth 1 -mindepth 1 -print0 2>/dev/null)
  echo -e "Hay ${#dirs[@]} directorios: $(printf "%s\n" "${dirs[*]}")"
  echo -e "Hay ${#ejec[@]} ficheros ejecutables: $(printf "%s\n" "${ejec[*]}")"
  echo -e "Hay ${#texts[@]} ficheros de texto: $(printf "%s\n" "${texts[*]}")"
done
