#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Especifica un solo comando como argumento"
  exit 1
else
  location=$(find / -name $1 2>/dev/null)
  if [[ -z $location ]]; then
    echo ""$1" no es un comando válido"
  else
    echo "El comando "$1" devuelve lo siguiente"
    exec "$1" 
  fi
fi
