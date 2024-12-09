#!/bin/bash

read -p "Directorio destino: " dir

check_dir=$(find / -type d -name "$dir" 2>/dev/null | grep "$dir") # Solo vale el exacto
if [ -z "$check_dir" ]; then
  echo "El directorio destino no existe"
  exit 1
fi

read -p "Archivo que se quiere copiar: " file

check_file=$(find / -type f -name "$file" 2>/dev/null | grep "$file") # Solo vale el exacto
if [ -z "$check_file" ]; then
  echo "El archivo destino no existe"
  exit 1
fi

check_perm=$(ls -l "$check_file" | awk '$1 ~ /^.r/ {print $NF}')
if [ -z "$check_perm" ]; then
  echo "No tienes permisos de lectura" # Esto no sé por qué lo pide el enunciado
  exit 1
fi

cp "$check_file" "$check_dir"
