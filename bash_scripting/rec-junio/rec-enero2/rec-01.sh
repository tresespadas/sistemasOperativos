#!/usr/bin/env bash

### usuarios_sistema ###

if [[ $# -ne 0 ]]; then
  echo "Número de argumentos incorrecto. $0" >&2
  exit 1
fi

awk -F: '$3 >= 1000 { print "Linea "NR": "$1; u++ } END { print "Usuarios en el sistema: "NR"\nNº de usuarios registrados: "u"\nNº de usuarios que son demonios: "NR-u }' /etc/passwd
