#!/usr/bin/env bash

if [[ "$#" -gt 1 ]]; then
  echo "Este script sólo admite un parámetro como máximo"
  exit 1
fi

validar_dir()
{
  if [[ -d "$1" ]]; then 
    printf "%s\n" $(realpath "$1")
    return
  else
    mapfile -t dir_paths < <(find /home/ -type d -name "$1" 2>/dev/null)
    if [[ "${#dir_paths[@]}" -eq 0 ]]; then
      return
    else
      printf "%s\n" "${dir_paths[@]}"
      return
    fi
  fi
}

clasifica()
{
  declare -a dirs=() exec=() regu=()
  while IFS= read -r -d '' file; do
    if [[ -d "$file" ]]; then
      dirs+=("$(basename "$file")")
    elif [[ -x "$file" && -f "$file" ]]; then
      exec+=("$(basename "$file")")
    elif [[ -f "$file" ]]; then
      regu+=("$(basename "$file")")
    fi
  done < <(find "$1" -maxdepth 1 -mindepth 1 -print0 2>/dev/null)  
  echo "Hay "${#dirs[@]}" directorios en $1: ${dirs[*]}"
  echo "Hay "${#exec[@]}" ficheros ejecutables en $1: ${exec[*]}"
  echo "Hay "${#regu[@]}" ficheros regulares en $1: ${regu[*]}"
  echo
}

dir=${1:-$PWD}

mapfile -t arrDir < <(validar_dir "$dir")
if [[ "${#arrDir[@]}" -eq 0 ]]; then
  echo "No existe el directorio especificado en el sistema"
  exit 2
fi

for file in "${arrDir[@]}"; do
  clasifica "$file"
done

