#!/bin/env bash

if [[ "$#" -eq 0 ]]; then
  echo "Uso: -n (número de lineas del fichero) -p (permisos del fichero) -t (contenido del fichero)"
  exit 1
fi

validar_archivo()
{
  local ruta_fichero=$(find /home/ -type f -name "$1" 2>/dev/null)

  if [[ -z "$ruta_fichero" ]]; then
    echo "La fecha actual es $(date) y el usuario que lo ejecuta es $USER" >> "$1"
    chmod 644 "$1"
    return 1
  else
    return 0
  fi
}

while getopts 'n:p:t:' opt; do
  case $opt in
    n|p|t)
      validar_archivo "$OPTARG"
      if [[ $? -eq 0 ]]; then
        ruta_fichero=$(find /home/ -type f -name "$OPTARG" 2>/dev/null)
        if [[ -n "$ruta_fichero" ]]; then
          case $opt in
            n) echo "Lineas: $(wc -l "$ruta_fichero" | awk '{ print $1}')";;
            p) ls -l "$ruta_fichero" | awk '{ print $1 }';;
            n) less "$ruta_fichero";;
          esac
        else
          exit 0
        fi
      fi
      ;;
    *) echo "Opción inválida";;
  esac
done
