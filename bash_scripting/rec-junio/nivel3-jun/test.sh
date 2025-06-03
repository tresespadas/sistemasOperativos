#!/usr/bin/env bash

if [[ -e "$1" ]]; then
  echo "Existe"
else
  exit 1
fi

