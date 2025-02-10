#!/bin/bash

visualizarUsuario(){
	read -p "Introduce el UID del usuario: " uid_user
	uid_check=$(cat /etc/passwd | awk -F ":" '$3 ~ /^....+$/ {print $3}' | grep -E "$uid_user$")
	if [ ! -z "$uid_check" ]; then
		login=$(cat /etc/passwd | grep "$uid_user" | awk -F ":" '$3 ~ /^....+$/ {print $1}')
		echo "Login: "$login""
		group_principal=$(cat /etc/passwd | grep "$login" | awk -F ":" '$4 ~ /^....+$/ {print $4}')
		group=$(cat /etc/group | grep "$group_principal" | awk -F ":" '{print $1}')
		echo "Nombre del grupo principal: "$group""
		big_file=$(ls -R -la /home/$login 2>/dev/null | awk -F " " '{print $5, $NF}' | sort -u -r | head -n 1 | awk '{print $2}')
		ruta_big_file=$(find /home/$login -name "$big_file" 2>/dev/null)
		echo -e "Fichero mas grande de su directo de trabajo:\n$ruta_big_file"
		size_big_file=$(ls -l "$ruta_big_file" | awk '{print $5}')
		echo -e "Tamaño de dicho fichero:\n$size_big_file"
	else
		echo "Dicho usuario NO existe en el sistema"
	fi
}

conectadoUser(){
	read -p "Introduce el UID del usuario: " uid_user
	user_actual=$(cat /etc/passwd | grep "$uid_user" | awk -F ":" '{print $1}')
	user_connected=$(who | awk -F " " '{print $1}')
	if [ "$user_actual" = "$user_connected" ]; then
		ps | sort -r 
	else
		echo "Dicho usuario NO está conectado al sistema actualmente"
	fi
}

listUser(){
	cat /etc/passwd | awk -F ":" '$3 ~ /^....+$/ {print $1}' | sort
}

while true; do
	echo -e "\n************ MENÚ ADMISTRATOR *********************"
	echo "1.- Visualizar datos personales."
	echo "2.- Ver si está conectado."
	echo "3.- Listado de usuarios disponibles dentro del sistema."
	echo "4.- Salir"
	
	read -p "Introduce la opción elegida: " opcion

	if [ "$opcion" -eq 1 ]; then
		visualizarUsuario;
	elif [ "$opcion" -eq 2 ]; then
		conectadoUser;
	elif [ "$opcion" -eq 3 ]; then
		listUser;
	elif [ "$opcion" -eq 4 ]; then
		break
		exit 0
	else
		echo "Opción inválida."
	fi
done
