#!/usr/bin/env bash

if [[ $UID -eq 0 ]]; then
  echo "Eres root"
fi
