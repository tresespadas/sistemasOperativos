#!/bin/bash

if [ "$#" -eq 0 ]; then
  cat "$0"
  exit 0
fi

fileTester() {
  file=$(find / -type f -name "$1" 2>/dev/null)
  if [ -z "$file" ]; then
    echo "El fichero no existe"
    exit 1
  fi
  cat "$file"
}

programTester() {
  program=$(find / -type f -executable -name "$1" 2>/dev/null) # El ejercicio se puede complicar si existe más de un ejecutable que comparta el nombre
  if [ -z "$program" ]; then # Aquí lo he dejado como -f por el tema de los binarios del sistema
    echo "El programa no existe"
    exit 1
  fi
  exec "$program"
}

ownerShower() {
  file=$(find / -type f -name "$1" 2>/dev/null)
  if [ -z "$file" ]; then
    echo "El fichero no existe"
    exit 1
  fi
  ls -l "$file" | awk '{print $3}'
}

while getopts "m:x:p:" arg; do
  case $arg in
    m) fileTester "$OPTARG";;
    x) programTester "$OPTARG";;
    p) ownerShower "$OPTARG";;
    *) echo "Opción inválida"; exit 1;;
  esac
done
