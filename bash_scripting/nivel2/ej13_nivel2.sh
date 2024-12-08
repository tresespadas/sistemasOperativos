#!/bin/bash

if [ "$#" -ne 2 ]; then		
  echo "Se precisan dos argumentos"
  exit 1
fi

file1=$(find / -type f -name "$1" 2>/dev/null)
file2=$(find / -type f -name "$2" 2>/dev/null)
if [ -z "$file1" ] || [ -z "$file2" ]; then
  echo "Alguno de los ficheros no existe. Especifica ficheros existentes, por favor."
  exit 2
fi

size1=$(ls -l "$file1" | grep -w "$1" | awk -F " " '{print $5}')
size2=$(ls -l "$file2" | grep -w "$2" | awk -F " " '{print $5}')
if [ "$size1" -gt "$size2" ]; then
  echo "El archivo '$1' tiene un mayor tamaño que el archivo '$2'"
  exit 0
elif [ "$size1" == "$size2"]; then
  echo "Ambos archivos tienen el mismo tamaño" 
  exit 0
else
  echo "El archivo '$2' tiene un mayor tamaño que el archivo '$1'"
  exit 0
fi
