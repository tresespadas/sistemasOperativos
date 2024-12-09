#!/bin/bash

if [ "$#" -gt 1 ]; then
  echo "No se permite más de un parámetro"
  exit 1
fi

if [ "$#" -eq 0 ]; then
  dir=$(pwd)
else
  dir="$1"
fi

file_text=0
file_exec=0
file_dir=0
list=$(ls -1 "$dir")
for i in $list; do
  if [ -x "$dir/$i" ]; then
    ((file_exec++))
    continue
  elif [ -f "$dir/$i" ]; then
    ((file_text++))
    continue
  elif [ -d "$i" ]; then
    ((file_dir++))
    continue
  fi
done

echo "$file_exec"
echo "$file_text"
echo "$file_dir"
