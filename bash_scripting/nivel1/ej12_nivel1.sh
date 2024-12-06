#!/bin/bash

if [[ $# -eq 0 ]]; then
  echo "Indica, mediante parámetro, los ficheros o directorios"
  exit 1
else
  for param in $@; do
    user_input=$param
    file=$(find / -name $param 2>/dev/null)
    if [[ -z $file ]]; then # -z para comprobar si $file está vacío
      echo "El fichero o directorio $param no existe"
    else 
      cat $file &>/dev/null # Comprobación de directorio mediante cat ;)
      if [[ $? -eq 0 ]]; then
        echo -e "[+] Se muestra el contenido de $param:\n" 
        cat $file
      else
        echo "$param es un directorio"
      fi 
    fi
  done
fi
