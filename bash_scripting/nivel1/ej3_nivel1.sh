#!/bin/bash

if [[ "$#" -gt 0 ]]; then
  for((i=1;i<="$#";i++))
  do
    echo "${!i}"
  done
else
  echo "Error. No hay parámetros"
  exit 1
fi
