#!/bin/bash

read -p "dir : " dir # Yo lo he hecho para que pregunte al usuario

ruta=$(find / -type d -name $dir 2>/dev/null)
if [ -z "$ruta" ]; then
  echo "El directorio no existe"
  exit 1
else
  ls -l "$ruta"
  cd "$(dirname "$ruta")" #dirname me da el nombre del directorio padre
  ls -l | grep "$dir"
fi
