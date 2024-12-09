#!/bin/bash

if [ "$#" -ne 2 ];then
  echo "Especifica extrictamente dos argumento"
  exit 1
fi

dir=$(find / -type d -name "$1" 2>/dev/null | head -n 1) # IMPORTANTE: Sólo el primero
if [ -z "$dir" ]; then
  echo "El directorio no existe"
  exit 2
fi

ls "$dir" | grep -E "$2"
