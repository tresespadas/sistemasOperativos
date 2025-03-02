#!/bin/bash

read -p "Introduce dos números: " num1 num2
read -p "Introduce un operando (+, -, *, /): " operando
printf "Salida: %d %s %d = %d\n" "$num1" "$operando" "$num2" "$(( $num1 $operando $num2 ))"
