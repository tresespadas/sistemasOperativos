#!/bin/env bash

user_connected() {
  who -q | grep -v =
}

user_process() {
  ps au
}

user_mem() {
  free -h | grep "Memoria:" | awk '{print $3}'
}

user_disk() { # Duda
  du -sh / 2>/dev/null | awk '{print $1}'
}

exit_menu() {
  echo "Saliendo..."
  sleep 0.5
  exit 0
}

while true; do
  echo "*** MENÚ ***"
  echo "1. Usuarios conectados al sistema"
  echo "2. Procesos que ejecuta un usuario"
  echo "3. Uso de memoria que está haciendo el sistema"
  echo "4. Uso de espacio de disco"
  echo "5. Salir del menú"
  read -p "Introduce una opción: " opt

  case "$opt" in
    1)
      user_connected;
      ;;
    2)
      user_process;
      ;;
    3)
      user_mem;
      ;;
    4)
      user_disk;
      ;;
    5)
      exit_menu;
      ;;
    *) 
      echo "Opción inválida"
      ;;
  esac
done


