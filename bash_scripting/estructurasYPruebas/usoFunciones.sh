#!/bin/env bash

saludo() {
  echo "${1:-anónimo}"
}

read -p "Introduce un archivo: " archivo

funcion1() {
  find / -type f -name $1 2>/dev/null
}

funcion2() {
  find / -type d -name $1 2>/dev/null
}

saludo 
variable=$(funcion1 $archivo)
echo $variable
