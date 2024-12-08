#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Especifica un argumento"
  exit 1
fi

grupo=$(cat /etc/group | grep -iw "$1" 2>/dev/null)
if [ -z "$grupo" ]; then
  echo "El grupo no existe"
  exit 2
else
  gid=$(echo "$grupo" | awk -F ":" '{print $3}')
  echo "El grupo existe y tiene como GID '$gid'"
fi
