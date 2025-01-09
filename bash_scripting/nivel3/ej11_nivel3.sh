#!/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Especifique sólo un argumento"
  exit 1
fi

# cat /etc/passwd | awk -F ":" '$3 ~ /....+/ {print $1}'
