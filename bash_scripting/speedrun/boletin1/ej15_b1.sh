#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Uso: $0 -e <scripts a ejecutar> -m <scripts a mostrar>"
  exit 1
fi

ejecutar() {
  for file in "$@"; do
    path=$(find / -name "$file" 2>/dev/null)
    if [ -z $path ]; then
      echo "El archivo '$file' no se encuentra en el sistema"
      return
    elif [ -d $path ]; then
      echo "El archivo '$file' es realmente un directorio y no se puede ejecutar"
      return
    elif [ -f $path ]; then
      bash $path
    fi
  done
}

mostrar() {
  for file in "$@"; do
    path=$(find / -name "$file" 2>/dev/null)
    if [ -z $path ]; then
      echo "El archivo '$file' no se encuentra en el sistema"
      return
    elif [ -d $path ]; then
      echo "El archivo '$file' es realmente un directorio y no se puede ejecutar"
      return
    elif [ -f $path ]; then
      cat "$path"
    fi
  done
}

while getopts "e:m:" arg; do
  case $arg in
    e) 
      ejecutar "$OPTARG" "${@:OPTIND}"
      shift $((OPTIND - 1))
      ;;
    m)
      mostrar "$OPTARG" "${@:OPTIND}"
      shift $((OPTIND - 1))
      ;;
    *) echo "Operación inválida"; exit 1;;
  esac
done
