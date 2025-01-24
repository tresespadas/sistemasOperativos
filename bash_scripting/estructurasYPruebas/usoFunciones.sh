#!/bin/env bash

saludo() {
  echo "$1"
}

read -p "Introduce un archivo: " archivo

funcion1() {
  find / -type f -name $1
}

funcion2() {
  find / -type d -name $1
}

variable=$(funcion1 $archivo)


