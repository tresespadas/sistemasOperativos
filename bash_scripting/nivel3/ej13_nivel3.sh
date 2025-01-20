#!/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Especifique una palabra"
  exit 1
fi

palabra=($(echo "$1" | sed 's/./& /g'))


for i in "${palabra[@]}"; do
  if [[ "$i" =~ [aeiouAEIOU] ]]; then
    echo "$i es una vocal"
  fi
  if [[ ! "$i" =~ [aeiouAEIOU] ]]; then
    echo "$i es una consonante"
  fi
done
