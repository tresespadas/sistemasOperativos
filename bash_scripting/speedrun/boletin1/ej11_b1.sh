#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Indica al menos un fichero/directorio."
  exit 1
fi

finder=()
for arg in "$@"; do
  while read -r result; do
    finder+=("$result")
  done < <(find / -name "$arg" 2>/dev/null) 
done

for i in "${finder[@]}"; do
  if [[ -z $i ]]; then
    echo "El fichero o directorio no se encuentra en el sistema"
    continue
  elif [[ -d $i ]]; then 
    echo "El parámetro $i corresponde a un directorio"
    continue
  elif [[ -f $i ]]; then
    echo "El parámetro $i corresponde a un archivo regular"
    continue
  else
    echo "El parámetro $i no se ni un directorio ni un archivo regular"
    continue
  fi
done
