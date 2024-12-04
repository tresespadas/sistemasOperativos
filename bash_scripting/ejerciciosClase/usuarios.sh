#!/bin/bash


if [[ $(whoami) == "root" ]]
	then
		while true; do
			echo -e "\n 1.- Crear usuario\n 2.- Borrar usuario\n 3.- Crear grupo\n 4.- Añadir usuario a un grupo\n 5.- Salir\n"
			read -p "Introduce la opción elegida: " option
			break
		done
		case $option in
			1)
				read -p "Nombre del nuevo usuario: " new_user
				cat /etc/passwd | grep -iw "^$new_user" &> /dev/null
				if [[ $? -eq 0 ]]
				then
					echo "El usuario existe"
				else
          read -sp "Elige una contraseña para el nuevo usuario: " new_user_pass
          echo
          sudo useradd -m -p $new_user_pass $new_user
				fi
				;;
			2)
				echo "Esta es la opción $option"
        read -p "Nombre del usuario que se desea borrar: " $user_del
        echo $user_del
				cat /etc/passwd | grep -iw "^$user_del" &> /dev/null
				if [[ $? -eq 0 ]]
				then
					echo "El usuario existe"
          sudo userdel $user_del # ARREGLAR - No funciona
				else
					echo "El usuario no existe"
				fi
				;;
			3)
				echo "Esta es la opción $option" # Opcion de crear grupo
				;;
			4)
				echo "Esta es la opción $option" # Opcion de añadir usuario a grupo
				;;
			5)
        exit 0
				;;
		esac
	else
		echo "Este script solo puede ser ejecutado como ROOT"
		exit 1
fi
