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
            echo "Se ha creado el usuario $new_user con su directorio home personal"
				fi
				;;
			2)
				read -p "Nombre del usuario que se desea borrar: " user_del
				cat /etc/passwd | grep -iw "^$user_del" &> /dev/null
				if [[ $? -eq 0 ]]
					then
						echo "El usuario existe, se procede a borrarlo y a su directorio home"
						sudo userdel $user_del
						sudo rm -rf /home/$user_del
					else
						echo "El usuario no existe"
				fi
				;;
			3)
        read -p "Nombre del grupo que se desea crear: " group_create
        cat /etc/group | grep -iw "^$group_create" &> /dev/null
        if [[ $? -eq 0 ]]
          then
            echo "El grupo existe"
          else
            echo "El grupo no existe, se procede a borrarlo"
            sudo groupadd -f $group_create
        fi
				;;
			4)
				echo "Esta es la opción $option" # Opcion de añadir usuario a grupo
        read -p "Nombre del usuario que se quiere añadir al grupo: " user_add
        cat /etc/passwd | grep -iw "^$user_add" &> /dev/null
        if [[ $? -eq 0 ]]
          then
            echo "El usuario existe"
            read -p "Especifique a qué grupo se quiere añadir el usuario $user_add: " group_add
            cat /etc/group | grep -iw "^$group_add" &> /dev/null
            if [[ $? -eq 0 ]]; then
              echo "El grupo existe"
              sudo usermod -aG $group_add $user_add 
            else
              echo "El grupo no existe"
            fi
          else
            echo "El usuario no existe"
        fi
				;;
			5)
        exit 0
				;;
		esac
	else
		echo "Este script solo puede ser ejecutado como ROOT"
		exit 1
fi
