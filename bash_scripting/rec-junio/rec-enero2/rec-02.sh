#!/usr/bin/env bash

### noread.sh  ###

if [[ "$#" -ne 1 ]]; then
  echo "Este programa sólo admite un parámetro: un directorio" >&2
  exit 1
fi

if [[ -d "$1" ]]; then
  declare -a nolectura_array=()
  while IFS= read -r -d '' file; do
    if [[ ! -r "$file" ]]; then
     nolectura_array+=$(basename $file" ") 
    fi
  done < <(find "$1" -maxdepth 1 -mindepth 1 -print0 2>/dev/null)
else
  echo "ERROR. $1 NO es un directorio válido"
fi

if [[ "${#nolectura_array[@]}" -eq 0 ]]; then
  exit 0
else
  fecha=$(date +%d-%m-%Y-%H:%M)
  echo "La lista de ficheros del directorio $1 SIN permiso de lectura es:" >> listadeficheros$fecha
  printf "%s\n" "${nolectura_array[*]}" >> listadeficheros$fecha
fi
