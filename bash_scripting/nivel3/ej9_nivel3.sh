#!/bin/env bash

if [ "$#" -ne 2 ]; then
  echo "Se precisan dos parámetros."
  exit 1
fi

file1=$(find / -type f -name "$1" 2>/dev/null)
file2=$(find / -type f -name "$2" 2>/dev/null)

if [[ -z "$file1" || -z "$file2" ]]; then
  echo "Los parámetros no existen como ficheros"
  exit 1
else
  size1=$(stat --format=%s "$file1")
  size2=$(stat --format=%s "$file2")
  echo "El fichero '$1' pesa '$size1'"
  echo "El fichero '$2' pesa '$size2'"
  # En fichero menores a 1KB sale 0 por los decimales, por estética lo he comentado y dejado en bytes
  # size1_kb=$((size1/1024))
  # size2_kb=$((size2/1024))
  #
  # echo "El fichero '$1' pesa '$size1_kb' KB"
  # echo "El fichero '$2' pesa '$size2_kb' KB"
fi
