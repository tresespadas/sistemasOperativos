#!/bin/bash
set -x

if [ "$#" -ne 2 ]; then
  echo "Especifica dos nombres de ficheros que van a intercambiar el nombre"
  exit 1
fi

var="$2"
cp $1 temp
mv $2 $1
mv temp $var

set +x
