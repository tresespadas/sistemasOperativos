#!/bin/bash

visualizarUsuario(){
  read -p "Introduce el UID del usuario: " uid_user

  check_uid=$(awk -F ":" -v uid=$uid_user '$3 == uid {print $1}' /etc/passwd)
  if [ -z "$check_uid" ]; then
    echo "No existe el usuario en el sistema"
    return
  else
    echo "Login: $check_uid"
  fi

  user_gid=$(awk -F ":" -v uid=$uid_user '$3 == uid {print $4}' /etc/passwd)
  user_gid_name=$(awk -F ":" -v gid=$user_gid '$3 == gid {print $1}' /etc/group)
  echo "Nombre del grupo principal: $user_gid_name"
  
  disk_space=$(du -sh /home/$check_uid | awk '{print $1}')  
  echo "Espacio ocupado en el directorio personal: "$disk_space""

  biggest_file_path=$(du -ah /home/$check_uid 2>/dev/null | sort -n -r | head -n 1 | awk '{print $2}')
  echo "El fichero más grande en su directorio personal: $biggest_file_path"

  size_biggest_file=$(du -ah /home/$check_uid 2>/dev/null | sort -n -r | head -n 1 | awk '{print $1}')
  echo "Tamaño de dicho fichero es: $size_biggest_file"
}

conectadoUsuario(){
  read -p "Introduce el UID del usuario: " uid_user
  check_uid=$(awk -F ":" -v uid=$uid_user '$3 == uid {print $1}' /etc/passwd)
  user_connected=($(who | awk -F " " '{print $1}'))
  
  for user in "${user_connected[@]}"; do
    if [ "$user" == "$check_uid" ]; then
      ps au | sort -r
    else
      echo "Dicho usuario NO está conectado al sistema actualmente"
    fi
  done
}

listadoUsers(){
  awk -F ":" '$3 ~ /....+$/ {print $1}' /etc/passwd | sort
}

while true; do
  echo -e "\n************ MENÚ ADMINISTRADOR ************"
  echo "1.- Visualizar datos personales."
  echo "2.- Ver si está conectado."
  echo "3.- Listado de los usuarios disponibles en el sistema."
  echo "4.- Salir."

  read -p "Introduce la opción elegida: " opcion

  case $opcion in
    1) visualizarUsuario;;
    2) conectadoUsuario;;
    3) listadoUsers;;
    4) exit 0;;
    *) echo "Opción inválida."; exit 1;;
  esac
done
