#!/usr/bin/env bash

### tipo_fichero ###

for arg in "$@"; do
  #echo "$arg"
  if [[ -e "$arg" ]]; then
    echo $?
    arr=("$arg")
  else
    mapfile -t arr < <(find /home/ -name "$arg" 2>/dev/null)
    if [[ "${#arr[@]}" -eq 0 ]]; then
      echo ""$arg" no existe en el sistema" >&2
      continue
    fi
  fi

  for elemento in "${arr[@]}"; do
    if [[ -d "$elemento" ]]; then
      echo -n "Tamaño de "$elemento": "
      du -s --block-size=M "$elemento" 2>/dev/null | awk '{print $1}'
    elif [[ -f "$elemento" ]]; then
      echo "$(basename "$elemento") es un $(file -b "$elemento")" # hacerlo con -x, -f, -d
    fi
  done
done
