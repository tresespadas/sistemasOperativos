#!/bin/env bash

### fileodir ###

if [[ "$#" -eq 0 ]]; then
  echo "Especifique al menos un parámetro"
  exit 1
fi

for arg in "$@"; do
  arg_path=$(find /home/ -name "$arg" 2>/dev/null)
  if [[ -d "$arg_path" ]]; then
    echo -e "Listado el contenido de "$arg":\n"
    ls -la "$arg_path"
  elif [[ -f "$arg_path" ]]; then
    echo -e "Mostrando el contenido de "$arg":\n"
    cat "$arg_path"
  fi
done
