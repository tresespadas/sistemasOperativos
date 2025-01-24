#!/bin/env bash

if [ "$#" -ne 3 ]; then
  echo "Sólo admito 3 parámetros"
  exit 1
fi

array=($@)

for i in "${array[@]}"; do
  for ((j=${#i}; j>=0; j--)); do
    echo -n "${i:$j:1}"
  done
  echo
done
