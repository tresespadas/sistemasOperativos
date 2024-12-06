#!/bin/bash

if [[ -e $1 ]]; then
  chmod 777 "$1"
else
  echo "El fichero o directorio no existe"
  exit 1
fi
