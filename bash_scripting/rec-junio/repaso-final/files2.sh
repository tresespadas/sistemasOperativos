#!/usr/bin/env bash

if [[ "$#" -gt 1 ]]; then
  echo "Este script sólo admite un parámetro como máximo"
  exit 1
fi

validar_dir()
{
  if [[ -d "$1" ]]; then 
    realpath "$1"
  else
    find /home/ -type d -name "$1" 2>/dev/null
  fi
}

clasifica()
{
  declare -a dirs=() exec=() regu=()
  while IFS= read -r -d '' file; do
    if [[ -d "$file" ]]; then
      dirs+=$(basename $file" ")
      #dirs+=("$(basename "$file")")
    elif [[ -x "$file" && -f "$file" ]]; then
      exec+=$(basename $file" ")
      #exec+=("$(basename "$file")")
    elif [[ -f "$file" ]]; then
      regu+=$(basename $file" ")
      #regu+=("$(basename "$file")")
    fi
  done < <(find "$1" -maxdepth 1 -mindepth 1 -print0 2>/dev/null)  
  echo "Hay "${#dirs[@]}" directorios en $1: ${dirs[*]}"
  echo "Hay "${#exec[@]}" ficheros ejecutables en $1: ${exec[*]}"
  echo "Hay "${#regu[@]}" ficheros regulares en $1: ${regu[*]}"
  echo
}

dir=${1:-$PWD}
mapfile -t dir_path < <(validar_dir "$dir")
if [[ "${#dir_path[@]}" -eq 0 ]]; then
  echo "Error: No existe el directorio" >&2
  exit 2
fi
for path in "${dir_path[@]}"; do
  clasifica "$path"
done
