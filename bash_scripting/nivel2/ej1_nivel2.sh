#!/bin/bash

read -p "ruta: " ruta

if [[ -d $ruta ]]; then
  ls -l "$ruta"
else
  echo "[!] Se ha creado un log con el error"
  ls -l "$ruta" 2> listar_error
fi
