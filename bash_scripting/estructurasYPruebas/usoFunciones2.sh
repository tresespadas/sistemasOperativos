#!/bin/env bash

funcion1(){
  echo "Hola, $1"
}

dir=$(pwd)
funcion1 Pepe
funcion1 $dir
