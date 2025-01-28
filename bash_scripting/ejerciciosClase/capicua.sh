#!/bin/bash

es_capicua(){
  numero="$1"
  longitud_num=${#numero}
  fin=$((longitud_num - 1))
  inicio=0
  
  while [ "$fin" -gt "$inicio" ]; do
    if [ "${numero:$inicio:1}" == "${numero:$fin:1}" ]; then
      inicio=$((inicio + 1))
      fin=$((fin - 1))
    else
      echo "El número no es capicua"
      exit 1
    fi
  done

  echo "El número es capicua"

}

read -p "Introduce un número: " input
es_capicua "$input"
