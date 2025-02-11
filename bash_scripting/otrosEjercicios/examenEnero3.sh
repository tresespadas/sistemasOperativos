#!/bin/env bash

## noread.sh ##

if [ "$#" -ne 1 ]; then
  echo "Especifica un parámetro"
  exit 1
fi

dir_path=($(find / -type d -iname "*$1*" 2>/dev/null))
if [ -z "$dir_path" ]; then
  echo "El parámetro especificado no existe en el sistema"
  exit 1
fi

files_path=() # Declaro el array vacío
for i in ${dir_path[@]}; do
  files_path+=($(find "$i" -maxdepth 1 -mindepth 1 -print))
done

for i in ${files_path[@]}; do
  if [ ! -r "$i" ]; then
    echo "${i##*/}" >> listadeficheros"$(date +%d-%m-%y-%R)"
  fi
done
