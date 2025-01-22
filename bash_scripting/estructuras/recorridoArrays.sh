#!/bin/env bash

palabra="alvaro"
array=()

for ((i = 0; i < "${#palabra}"; i++)); do
  array+=("${palabra:$i:1}")
done

for i in "${array[@]}"; do
  echo $i
done

for i in "${!array[@]}"; do
  echo $i
done
