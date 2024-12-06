#!/bin/bash

# AUTOR: Álvaro | MÓDULO: Nivel 1 | FECHA: 3/12/24
# Programa que reciba tres palabras como parámetros y las visualice al revés

if [ "$#" -ne 3 ]
  then
    echo "No es igual a 3"
    exit 1
  else
    for ((i = $#; i >= 1; i--))
      do
        arg=${!i} # Sacar lo que vale el índice o "Expansión del párametro"
        echo "$arg"
      done
fi
