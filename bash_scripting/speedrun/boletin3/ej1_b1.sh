#!/bin/bash

input=("$@")

for i in "${input[@]}"; do
  input_path=$(find / -name "$i" 2>/dev/null)
  if [ -d "$input_path" ]; then
    echo -e "El directorio '$i' contiene:\n"
    ls "$input_path"
  elif [ -f "$input_path" ]; then
    echo -e "El fichero '$i' contiene:\n"
    cat "$input_path"
  else
    echo "Fichero inexistente en el sistema"
  fi
done
