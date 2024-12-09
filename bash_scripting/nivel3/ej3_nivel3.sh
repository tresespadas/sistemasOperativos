#!/bin/bash

if [ "$#" -gt 1 ]; then
  echo "No se permite más de un parámetro"
  exit 1
fi

if [ "$#" -eq 0 ]; then
  dir=$(pwd)
else
  dir=$(find / -type d -name "$1" 2>/dev/null | head -n 1)
fi

file_text=()
file_exec=()
file_dir=()
list=$(ls -1 "$dir")
for i in $list; do
  if [ -d "$dir/$i" ]; then
    file_dir+=("$i")
  elif [ -x "$dir/$i" ]; then
    file_exec+=("$i")
  elif [ -f "$i" ]; then
    file_text+=("$i")
  fi
done

echo "La clasificación de ficheros del directorio '$dir' es:"
if [ ${#file_text[@]} -gt 0 ]; then
  echo -n "Hay ${#file_text[@]} ficheros de texto: "
  for i in "${!file_text[@]}"; do
    if [ $i -lt $((${#file_text[@]} - 1)) ]; then
      echo -n "${file_text[$i]}, "
    else
      echo -n -e "${file_text[$i]}\n"
    fi
  done
fi


if [ ${#file_exec[@]} -gt 0 ]; then
  echo -n "Hay ${#file_exec[@]} ficheros ejecutables: "
  for i in "${!file_exec[@]}"; do
    if [ $i -lt $((${#file_exec[@]} - 1)) ]; then
      echo -n "${file_exec[$i]}, "
    else
      echo -n -e "${file_exec[$i]}\n"
    fi
  done
fi

if [ ${#file_dir[@]} -gt 0 ]; then
  echo -n "Hay ${#file_dir[@]} directorios: "
  for i in "${!file_dir[@]}"; do
    if [ $i -lt $((${#file_dir[@]} - 1)) ]; then
      echo -n "${file_dir[$i]}, "
    else
      echo -n -e "${file_dir[$i]}\n"
    fi
  done
fi
