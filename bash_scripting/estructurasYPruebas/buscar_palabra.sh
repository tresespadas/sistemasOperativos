#!/bin/env bash

## apuntesinformaticafp.com/actividades/ejercicios_bash.html

read -p "Indica la palabra que quieres buscar: " word
read -p "Indica el directorio donde quieres buscar la palabra '$word': " dir

# Suponiendo 1 hit
dir_path=$(find / -type d -name $dir 2>/dev/null)
if [ -z $dir_path ]; then
  echo -e "\nEl directorio no se encuentra en el sistema. Saliendo..."
  exit 1
fi

while IFS= read -r file; do
  if [ -d "$file" ]; then
    continue
  else
    cat "$file" | grep "$word" &>/dev/null
    if [ $? -eq 0 ]; then
      echo "Se ha encontrado la palabra '$word' en el archivo $file"
    fi
  fi
done < <(find "$dir_path" -mindepth 1 -print)
