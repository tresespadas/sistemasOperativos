#!/bin/bash

while true; do
  echo "1) Borrar un fichero"
  echo "2) Imprimir un fichero"
  echo "3) Salir"
  read -p "Opción: " opt

  if [ "$opt" == "1" ]; then
    read -p "¿Qué fichero deseas borrar?: " fich
    ruta_fich=$(find / -type f -name "$fich" 2>/dev/null | grep "$fich")
    rm -f "$ruta_fich"
  elif [ "$opt" == "2" ]; then
    read -p "¿Qué fichero deseas imprimir?: " fich
    ruta_fich=$(find / -type f -name "$fich" 2>/dev/null | grep "$fich")
    cat "$ruta_fich"
  elif [ "$opt" == "3" ]; then
    exit 0
  else
    echo "Opción inválida"
  fi
done
