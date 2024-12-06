#!/bin/bash

if [[ $# -eq 1 ]]; then
  user_input=$1
  file=$(find / -name $user_input 2>/dev/null)
  if [[ -z $file ]]; then # -z para comprobar si $file está vacío
    echo "El fichero o directorio no existe"
  else 
    cat $file &>/dev/null # Comprobación de directorio mediante cat ;)
    if [[ $? -eq 0 ]]; then
      echo "El fichero existe" 
    else
      echo "Se trata de un directorio"
    fi 
  fi
else
  echo "Indica, mediante parámetro, el fichero o directorio del que se quiere conocer su existencia"
fi
