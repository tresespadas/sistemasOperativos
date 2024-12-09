#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Se requiere al menos un argumento"
  exit 1
fi

for i in $@; do
  file=$(find / -type f -name "$i" 2>/dev/null | head -n 1)
  dir=$(find / -type d -name "$i" 2>/dev/null | head -n 1)
  echo 
  if [ ! -z "$file" ]; then
    cat "$file"
  elif [ ! -z "$dir" ]; then
    ls "$dir"
  else
    echo "El fichero o directorio no existe"
  fi
done
