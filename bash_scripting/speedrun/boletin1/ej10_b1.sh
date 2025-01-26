#!/bin/env bash

if [ "$#" -eq 0 ]; then
  echo "Especifica al menos un fichero que quieras copiar"
  exit 1
fi

dir_path=$(find / -name "Seguridad" -type d 2>/dev/null)

for file in "$@"; do
  file_path=$(find / -name $file 2>/dev/null)
  echo -e "Comprobando si existe la carpeta 'Seguridad'...\n"
  if [ -z $dir_path ]; then
    mkdir /tmp/Seguridad
    dir_path="/tmp/Seguridad"
    echo -e "Se ha creado la carpeta Seguridad en $dir_path.\n"
  else
    echo -e "La carpeta Seguridad existe en $dir_path\n"
  fi
  echo -e "Copiando los siguientes archivos en $dir_path:\n$file_path"
  cp -i $file_path $dir_path # Con el comando -i te pregunta si los quieres sobreescribir
done
