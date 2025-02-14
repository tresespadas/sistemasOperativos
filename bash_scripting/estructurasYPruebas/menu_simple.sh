#!/bin/bash

echo "¿Cuál es tu color favorito?: "

select COLOR in azul rojo verde amarillo; do
  echo "Tu color favorito es " $COLOR
  break
done
