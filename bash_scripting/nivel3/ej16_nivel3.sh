#!/bin/env bash

if [ $EUID -ne 0 ]; then
  echo "Debes ser root para ejecutar este script"
  exit 1
fi

uso() {
  echo "Uso de $0: Se necesita el parámetro -u <usuario> para realizar la copia de seguridad"
  exit 1
}

copia_seguridad() {
  fecha_copia_seguridad=$(date +%d%m%y)
  nombre_copia_seguridad=$(echo "copiaSeguridad$fecha_copia_seguridad")
  echo "Realizando copia de seguridad del usuario $1 con nombre $nombre_copia_seguridad. Esta operación podría tardar un tiempo..."
  tgz "$nombre_copia_seguridad" /home/$1 &>/dev/null
  echo "Copia de seguridad realizada satisfactoriamente."
}

if [ $# -eq 0 ]; then
  uso
fi

while getopts "u:" arg; do
  case $arg in
    u) copia_seguridad "$OPTARG";;
    *) uso; exit 1;;
  esac
done
