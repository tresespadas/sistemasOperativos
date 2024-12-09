#!/bin/bash

read -p "Numero total alumnos: " total

nota_alumno=0
num_aprobados=0
for i in $(seq 1 1 $total); do
  read -p "Nota del alumno "$i": " nota
  if [ "$nota" -ge 5 ] ; then
    ((num_aprobados++))
  fi
  ((nota_alumno+=$nota))
done

echo "Han aprobado $num_aprobados alumnos"
MEDIA=$(echo "scale=2;(($nota_alumno/$total))" | bc)
echo "La media de la clase es $MEDIA"
