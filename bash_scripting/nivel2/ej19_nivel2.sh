#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Debes especificar un argumento como palabra secreta"
  exit 1
fi

intento=1
while true; do
  echo "Intento número '$intento'"
  read -p "¿En qué palabra estoy pensando?: " guess
  if [ "$guess" == "$1" ]; then
    echo "Acertaste!"
    break
    exit 0
  fi
  ((intento++))
done
