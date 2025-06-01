#!/bin/env bash

dir=$(find /home/ -type d -name "$1" 2>/dev/null)

if [[ -z "$dir" ]]; then
  echo "El directorio especificado no existe" >&2
  exit 1
fi

shift 1

for file in "$@"; do
  valid_file=$(find /home/ -type f -name "$file" 2>/dev/null)
  if [[ -z "$valid_file" ]]; then
    echo "El fichero '$file' no existe. Abortando copia..."
    exit 2
  else
    cp -v "$valid_file" "$dir"
  fi
done
