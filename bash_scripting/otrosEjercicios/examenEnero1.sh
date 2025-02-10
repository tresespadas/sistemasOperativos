#!/bin/env bash

## files.sh ##

filetypes(){
  # Comprobación de la existencia del directorio
  possible_dir=$(echo "$1" | tr -d "/")
  dir_path=$(find / -type d -name "$possible_dir" 2>/dev/null)
  if [ -z "$dir_path" ]; then
    echo "No existe dicho directorio."
    exit 1
  fi

  # Inicialización de los contadores
  contador_regular=0
  contador_ejecutable=0
  contador_dir=0

  # Bucle que lee el contenido del directorio
  while read -r line; do
    if [ -d "$line" ]; then
      ((contador_dir++))
    elif [ -x "$line" ]; then
      ((contador_ejecutable++))
    elif [ -f "$line" ]; then
      ((contador_regular++))
    else
      continue
    fi
  done < <(find "$dir_path" -mindepth 1 -maxdepth 1 -print)
  # done < <(ls -la $dir_path | awk -F " " '$NF !~ /\.$|\.\.$/ && $3 ~ /./ {print $NF}') # El regex elimina el "." y ".." pero no los ficheros ocultos (ej: .incognito)

  echo "Hay $contador_ejecutable ficheros ejecutables"
  echo "Hay $contador_regular ficheros regulares"
  echo "Hay $contador_dir directorios"
}

if [ "$#" -eq 0 ]; then
  dir=$(pwd)
  filetypes "${dir##*/}" # Expansión de parámetros para borrar el pwd hasta el directorio actual (sin /)
elif [ "$#" -eq 1 ]; then
  dir="$1"
  filetypes "$dir"
else
  echo "Se precisa uno o ningún parámetro."
  exit 1
fi
