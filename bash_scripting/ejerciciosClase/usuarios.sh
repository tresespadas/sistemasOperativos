#!/bin/bash


if [[ $(whoami) == "root" ]]
	then
		echo "Hola $(whoami)"  # Testeando el else - BORRAR
		while true; do
			echo -e "\n 1.- Crear usuario\n 2.- Borrar usuario\n 3.- Crear grupo\n 4.- Añadir usuario a un grupo\n 5.- Salir\n"
			read -p "Introduce la opción elegida: " option
			break
		done
		echo "Hola, $option" # Testeando el break anterior - BORRAR
		case $option in
			1)
				echo "Esta es la opción $option" # Testeando que entra aquí - BORRAR
				read -p "Nombre del nuevo usuario: " new_user
				echo "$new_user" # Testeando la variable user - BORRAR
				cat /etc/passwd | grep -iw "^$new_user" &> /dev/null
				if [[ $? -eq 0 ]]
				then
					echo "El usuario existe"
				else
					echo "El usuario no existe"
          #useradd
          read -p -s "Elige una contraseña para el nuevo usuario: " new_user_pass #ARREGLAR "-s"
          #sudo useradd -m -p ($new_user_pass $new_user
				fi
				;;
			2)
				echo "Esta es la opción $option"
				;;
			3)
				echo "Esta es la opción $option"
				;;
			4)
				echo "Esta es la opción $option"
				;;
			5)
				echo "Esta es la opción $option"
				;;
		esac
	else
		echo "Este script solo puede ser ejecutado como ROOT"
		exit 1
fi
