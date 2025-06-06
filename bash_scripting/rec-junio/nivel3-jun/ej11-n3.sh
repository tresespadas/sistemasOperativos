#!/usr/bin/env bash

### usuario_valido ###

if [[ "$#" -ne 1 ]]; then
  echo "Se precisa sólo un parámetro: un usuario"
fi

awk -F: -v user="$1" 'FILENAME=="/etc/group"{split($4,miembros,",");for(i in miembros) if(miembros[i]==user) grupo=grupo $1" "} FILENAME=="/etc/passwd" && $1==user{print "Directorio de trabajo: "$6, "UID: "$3, "Shell: "$NF, "Grupos: " grupo; found=1} END {if(!found) exit 1}' /etc/group /etc/passwd
if [[ $? -eq 1 ]]; then
  echo "El usuario no se encuentra en el sistema"
fi
