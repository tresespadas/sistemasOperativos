#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Especifica solo un argumento"
  exit 1
fi

dir=$(find / -type d -name "$1" 2>/dev/null | head -n 1)
if [ -z "$dir" ]; then
  echo "El directorio no existe"
  exit 2
fi

list=$(ls -l "$dir")
file_c=0
dir_c=0
for i in $list; do
  if [ -f "$dir/$i" ]; then
    ((file_c++))
  elif [ -d "$dir/$i" ]; then
    ((dir_c++))
  fi
done

echo "Ficheros en '$dir': $file_c"
echo "Directorios en '$dir': $dir_c"
