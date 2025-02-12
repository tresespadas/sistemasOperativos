#!/bin/env bash

## usuarios_sistema.sh ##

if [ "$#" -ne 0 ]; then
  echo "Número de argumentos incorrectos. $0"
  exit 1
fi

users_list=($(awk -F ":" '$3 >= 1000 {print $1}' /etc/passwd))

echo "Usuarios reales en el sistema"
for user in ${users_list[@]}; do
  line_number=$(awk -F ":" -v user=$user '$1 ~ "^"user"$" {print NR}' /etc/passwd)
  echo "Línea $line_number: $user"
done

echo -e "\nUsuarios en el sistema: $(cat -n /etc/passwd | tail -n 1 | awk '{print $1}')"

echo "Nº de usuarios registrados: ${#users_list[@]}"

demon_lists=($(awk -F ":" '$3 < 1000 {print $1}' /etc/passwd))
echo "Nº de usuarios que son demonios: ${#demon_lists[@]}"
