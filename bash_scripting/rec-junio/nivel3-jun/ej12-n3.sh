#!/usr/bin/env bash

### examen_ASIR ###

connected_user()
{
  echo
  who | awk '{print $1}'
  echo
}

process_user()
{
  echo
  ps au
  echo
  #Duda: $(ps a -u $USER)
}

memory_used()
{
  echo
  free -h | awk '{print $1 $3}' | grep Memoria
  echo
}

disk_used()
{
  echo -n "Espacio total en el disco: "
  du -chs ~ 2>/dev/null | grep total | awk '{print $1}'
  echo
}

while true; do
  echo "1. Usuarios conectados al sistema"
  echo "2. Procesos que ejecuta un usuario"
  echo "3. Uso de memoria que está haciendo el sistema"
  echo "4. Uso del espacio de disco"
  echo "5. Salir del menú"
  read -p "Opción: " opt

  case $opt in
    1) connected_user;;
    2) process_user;;
    3) memory_used;;
    4) disk_used;;
    5) exit 0;;
  esac
done
