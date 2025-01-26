#!/bin/bash

funcion_mostrar(){
  for i in "$@"; do
    echo $i
  done
}

funcion_mostrar_2(){
  echo "$@"
}

while getopts "f:g:" arg; do
  case $arg in
    f) 
      funcion_mostrar "$OPTARG"
      ;;
    g) 
      funcion_mostrar_2 "$OPTARG" "${@:OPTIND}"
      shift $((OPTIND - 1))
      ;;
    *) 
      echo "Operación inválida"
      exit 1
      ;;
  esac
done
