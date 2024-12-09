#!/bin/bash

if [ "$#" -eq 0 ] || [ "$#" -eq 1 ]; then
  echo "Especifica dos archivos"
  exit 1
fi

file1=$(find / -type f -name "$1" 2>/dev/null) # A veces encuentra más de uno, quizá añadir "head -n 1"
file2=$(find / -type f -name "$2" 2>/dev/null)
if [ -z "$file1" ] || [ -z "$file2" ]; then
  echo "Especifica archivos que existan"
  exit 2
fi

size1=$(stat "$file1" | grep "Size" | awk '{print $2}')
size1_kb=$((size1/1024))

size2=$(stat "$file2" | grep "Size" | awk '{print $2}')
size2_kb=$((size2/1024))

echo "$size1_kb" # El problema de la division es que no muestra decimales, por eso a veces sale 0KB
echo "$size2_kb"
