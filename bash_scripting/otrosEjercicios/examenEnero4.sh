#!/bin/env bash

## datos.sh ##

if [ "$#" -eq 0 ]; then
  echo "Uso: -n (número de lineas del fichero) -p (permisos del fichero) -t (contenido del fichero)"
  exit 1
fi

file_existence(){
  local file_path=$(find / -type f -iname "*$1*" 2>/dev/null)

  if [ -z "$file_path" ]; then
    echo "El fecha de hoy es $(date) y el usuario que ejecuta este script es $USER" >> "$1"
    chmod 644 "$1"
    return 1
  else
    return 0
  fi
}


while getopts "n:p:t:" arg; do
  case $arg in
    n|p|t)
      file_existence "$OPTARG"
      if [ $? -eq 0 ]; then
        file_path=$(find / -type f -iname "*$OPTARG*" 2>/dev/null)
        if [ -n "$file_path" ]; then
          case $arg in
            n)
              wc -l "$file_path" | awk -F " " '{print $1}'
              ;;
            p)
              ls -l "$file_path" | awk -F " " '{print $1}'
              ;;
            t)
              less "$file_path"
              ;;
          esac
        else
          exit 0
        fi
      fi
      ;;
    *)
      echo "Opción inválida"
      exit 1;;
    esac
done
