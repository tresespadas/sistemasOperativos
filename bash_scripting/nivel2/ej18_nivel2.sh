#!/bin/bash

if [ "$#" -ne 3 ]; then
  echo "Se requieren 3 argumentos"
  exit 1
fi
# He obviado comprobaciones de que si el archivo existe que ya se han hecho en otros ejercicios
echo "Argumento 1: "$1""
echo "Argumento 2: "$2""
echo -e "Argumento 3: "$3"\n"

cmp1=$(cmp "$1" "$2")
cmp2=$(cmp "$1" "$3")
cmp3=$(cmp "$2" "$3")
if [ -z "$cmp1" ]; then
  echo "'$1' es igual que '$2'"
  exit 0
elif [ -z "$cmp2" ]; then
  echo "'$1' es igual que '$3'"
  exit 0
elif [ -z "$cmp3" ]; then
  echo "'$2' es igual que '$3'"
  exit 0
else
  echo "Ningún archivo es igual entre ellos"
  exit 2
fi
