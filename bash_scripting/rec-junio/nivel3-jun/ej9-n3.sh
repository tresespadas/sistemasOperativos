#!/usr/bin/env bash

### tamaño ###

if [[ "$#" -eq 0 ]]; then
  echo "Se requieren dos parámetros para el funcionamiento del script."
  exit 1
elif [[ "$#" -eq 1 ]]; then
  echo "Falta un parámetro para el correcto funcionamiento del script"
  exit 2
elif [[ "$#" -gt 2 ]]; then
  echo "Se requieren dos parámetros para el funcionamiento del script."
  exit 3
fi

file1=$(find /home/ -type f -name "$1" 2>/dev/null)
file2=$(find /home/ -type f -name "$2" 2>/dev/null)

if [[ -z "$file1" ]]; then
  echo "'$file1' no se encuentra en el sistema"
elif [[ -z "$file2" ]]; then
  echo "'$file2' no se encuentra en el sistema"
fi

#echo -n "Tamaño del fichero '$1': "
#ls -lash "$file1" | awk '{ print $1 }'
#echo -n "Tamaño del fichero '$2': "
#ls -lash "$file2" | awk '{ print $1 }'

# Otra forma de hacerlo:
tamano1=$(stat -c "%s" "$file1" | awk '{ printf "%.1f", $1/1024 }')
echo "Tamaño del fichero '$1': $tamano1 KB"
tamano2=$(stat -c "%s" "$file2" | awk '{ printf "%.1f", $1/1024 }')
echo "Tamaño del fichero '$2': $tamano2 KB"

