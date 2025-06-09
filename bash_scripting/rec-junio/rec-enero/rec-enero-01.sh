#!/usr/bin/env bash

if [[ "$#" -gt 1 ]]; then
  echo "Este script sólo admite un directorio como parámetro. En caso de omitirse se hará sobre $(pwd)"
  exit 1
fi

validar_dir()
{
  if [[ -d "$1" ]]; then
    printf "%s\n" "$1"
    return
  fi

  mapfile -t dir < <(find /home/ -type d -name "$1" 2>/dev/null)

  if [[ "${#dir[@]}" -eq 0 ]]; then
    echo "No se ha encontrado el directorio especificado en el sistema" >&2
    exit 2
  fi
  
  # El "return" para mapfile de abajo
  printf "%s\n" "${dir[@]}"
}

clasifica_fich()
{
  declare -A tipos=([dir]=0 [exec]=0 [regu]=0)

  while IFS= read -r -d '' fich; do
    if [[ -d "$fich" ]]; then
      ((tipos["dir"]++))
    elif [[ -x "$fich" ]]; then
      ((tipos["exec"]++))
    elif [[ -f "$fich" ]]; then
      ((tipos["regu"]++))
    fi
  done < <(find "$1" -maxdepth 1 -mindepth 1 -print0 2>/dev/null)

  echo "Hay ${tipos["dir"]} directorios en '$1'"
  echo "Hay ${tipos["exec"]} archivos ejecutables en '$1'"
  echo "Hay ${tipos["regu"]} archivos regulares en '$1'"
}


dir=${1:-$PWD}

mapfile -t arrDir < <(validar_dir "$dir")

for i in "${arrDir[@]}"; do
  clasifica_fich "$i"
done
