#!/bin/env bash

# Ejercicio para quitar espacios a un parametro que se pasa al script

echo "$@"
echo $(echo "$@" | tr -d " ")
