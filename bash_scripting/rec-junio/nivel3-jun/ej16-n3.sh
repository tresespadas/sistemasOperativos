#!/usr/bin/env bash

### copia_seguridad ###

uso_script()
{
  echo "Uso de $0: ./ej16-n3.sh -u <USER> como ROOT"
  exit 1
}

copia_seguridad()
{
  fecha=$(date +%d%m%y)
  usuario=$(awk -F: '$3 >= 1000 { print $1 }' /etc/passwd | grep $1)
  if [[ -z "$usuario" ]]; then
    echo "$1 no se encuentra en el sistema" >&2
    exit 2
  fi
  tgz copiaSeguridad$fecha /home/$usuario
}

if [[ $UID -ne 0 ]]; then
  echo "Necesitas ser root para ejecutar este script"
  exit 1
fi

if [[ $# -eq 0 ]]; then
  uso_script
fi

while getopts ':u:' opt; do
  case $opt in
    u) copia_seguridad $OPTARG ;;
    \?) 
        echo "Error: Opción inválida" >&2
        uso_script
        ;;
    :)
        echo "Error: La opción -$OPTARG requiere un argumento" >&2
        uso_script
        ;;
  esac
done

uso_script
