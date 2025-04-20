#!/bin/bash

# Te crea el array desde stdin - Qué magia negra es esta?
mapfile -t array

for i in "${array[@]}"; do
  echo "$i"
done
