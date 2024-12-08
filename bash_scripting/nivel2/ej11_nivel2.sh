#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Especifica algún argumento"
  exit 1
fi

echo "El nombre del script es '$0'"
index=1
for i in $@; do
  echo "El argumento número '$index' es '$i'"
  ((index++))
done
echo "El numero total de argumentos es de '$#'"
