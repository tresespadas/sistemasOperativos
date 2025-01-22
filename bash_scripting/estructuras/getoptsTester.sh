#!/bin/env bash

if [ $# -eq 0 ]; then
  echo "Uso [-m <algo>] [-n <algo>]"
  exit 1
fi

getoptsTester() {
  echo "Comprobando argumento: $1"
}

getoptsTester_2() {
  echo "Comprobando otra vez argumento: $1"
}

while getopts "m:n:" arg; do
  case $arg in 
    m) getoptsTester "$OPTARG";;
    n) getoptsTester_2 "$OPTARG";;
    *) echo "Especifica el parámetro -m"; exit 1;;
  esac
done

# shift $((OPTIND - 1))
