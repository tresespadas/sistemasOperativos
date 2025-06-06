#!/usr/bin/env bash

### copia_seguridad ###

if [[ $UID -ne 0 ]]; then
  echo "Necesitas ser root para ejecutar este script"
  exit 1
fi
