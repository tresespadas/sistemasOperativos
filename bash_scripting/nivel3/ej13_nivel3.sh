#!/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Especifique una palabra"
  exit 1
fi

palabra=($(echo "$1" | sed 's/./& /g'))
vocal_count=0
consonante_count=0


for i in "${palabra[@]}"; do
  if [[ "$i" =~ [aeiouAEIOU] ]]; then
    ((vocal_count++))
    # echo "$i es una vocal"
  fi
  if [[ ! "$i" =~ [aeiouAEIOU] ]]; then
    if [[ "$i" =~ [0-9] ]]; then
      continue
    else
      ((consonante_count++))
      # echo "$i es una consonante"
    fi
  fi
done

echo "Hay $vocal_count vocales y $consonante_count consonantes"
