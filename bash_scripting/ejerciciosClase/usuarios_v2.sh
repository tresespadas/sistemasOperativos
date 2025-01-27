#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "Este script solo puede ser ejecutado bajo privilegios de administrador"
  exit 1
fi

create_user(){
  read -p "Introduce un nombre para el nuevo usuario: " new_user_name

  home_status=""
  while true; do
    read -p "¿Quieres crear un directorio /home/ para $new_user_name? (s/n): " sn
    case $sn in 
      [Ss]*) home_status="/home/$new_user_name" ; break ;;
      [Nn]*) read -p "Especifica qué directorio /home/ quieres para $new_user_name: " home_status ; break ;;
      *) echo "Contesta sí o no (s/n)";;
    esac
  done

  shell_status=""
  while true; do
    read -p "¿Quieres /bin/bash como shell por defecto $new_user_name? (s/n): " sn
    case $sn in 
      [Ss]*) shell_status="/bin/bash" ; break ;;
      [Nn]*) read -p "Especifica qué shell quieres para $new_user_name: " shell_status ; break;;
      *) echo "Contesta sí o no (s/n)";;
    esac
  done

  if [ "$home_status" == "/home/$new_user_name" ]; then
    echo "Creando usuario $new_user_name con directorio personal en $home_status y shell $shell_status"
    useradd -m -s "$shell_status" $new_user_name
  else
    echo "Creando usuario $new_user_name con directorio personal en $home_status y shell $shell_status"
    useradd -m -d "$home_status" -s "$shell_status" $new_user_name
  fi

  echo "Establece una contraseña para $new_user_name"
  passwd $new_user_name
}

delete_user(){
  read -p "Introduce el nombre del usuario que deseas borrar: " del_user_name
  list_users=($(awk -F ":" '$3 ~ /....+/ {print $1}' /etc/passwd))
  for users in "${list_users[@]}"; do
    if [ "$del_user_name" == "$users" ]; then
      echo "Eliminando usuario $del_user_name"
      userdel -r $del_user_name
      return
    else
      continue
    fi
  done
  echo "El usuario $del_user_name no se encuentra en el sistema"
}

create_group(){
  read -p "Introduce el nombre del grupo que quieres crear: " new_group_name
  groupadd "$new_group_name"
}

add_user_group(){
  list_users=()
  read -p "Introduce el nombre del grupo al que quieres añadir los usuarios: " group_name

  while true; do
    read -p "Introduce el nombre del usuario que quieres añadir a $group_name o pulsa INTRO para salir: " user_name
    if [ -z "$user_name" ]; then
      break
    else
      list_users+=("$user_name")
    fi
  done
  for users in "${list_users[@]}"; do
    adduser "$users" "$group_name"
  done
}

success_exit(){
  exit 0
}

while true; do
  echo "1.- Crear usuario"
  echo "2.- Borrar usuario"
  echo "3.- Crear grupo"
  echo "4.- Añadir usuario a grupo"
  echo "5.- Salir"

  read -p "Introduce la opción elegida: " opt

  case $opt in
    1) create_user
      ;;
    2) delete_user
      ;;
    3) create_group
      ;;
    4) add_user_group
      ;;
    5) success_exit
      ;;
    *) echo "Opción inválida"; exit 1;;
  esac
done
