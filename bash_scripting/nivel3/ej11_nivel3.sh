#!/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Especifique sólo un argumento"
  exit 1
fi

users=($(awk -F ":" '$3 ~ /....+/ {print $1}' /etc/passwd))

for user in "${users[@]}"; do
  if [ "$1" == $user ]; then
    echo "La carpeta personal del usuario $user está en $(awk -F ':' -v user=$user '$1 == user {print $6}' /etc/passwd)"
    echo "El UID del usuario $user es $(awk -F ':' -v user=$user '$1 == user {print $3}' /etc/passwd)"
    echo "El shell que el usuario $user ejecuta es $(awk -F ":" -v user=$user '$1 == user {print $7}' /etc/passwd)"
    user_group=$(awk -F ":" -v user=$user '$1 == user {print $4}' /etc/passwd)
    echo "El grupo principal al que pertenece el usuario $user es $(awk -F ":" -v group=$user_group '$3 == group {print $1}' /etc/group)"
    exit 0
  fi
done

echo "El usuario no está registrado en el sistema"
exit 1
