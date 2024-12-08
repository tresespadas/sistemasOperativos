#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Especifica un argumento"
  exit 1
fi

dir=$(find / -type d -name "$1" 2>/dev/null)
if [ -z "$dir" ]; then
  echo "El directorio no exite"
  exit 2
else
  echo -e "El contenido del '$dir' es\n"
  ls "$dir"
fi
