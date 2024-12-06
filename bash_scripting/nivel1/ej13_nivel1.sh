#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Especifica qué dos ficheros deben intercambiar su nombre"
  exit 1
else
  file1="$1"
  file2="$2"
  cp $2 temp
  mv $file1 $2
  mv temp $1
fi
