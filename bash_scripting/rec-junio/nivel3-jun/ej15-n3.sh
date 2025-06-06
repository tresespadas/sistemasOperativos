#!/usr/bin/env bash

### Rec_ASIR ###

uso_programa()
{
  echo "Uso del programa: Elige una de las opciones del menú"
  exit 1
}

listar_archivos()
{
  read -p "Escribe el nombre del directorio: " dir
  dir_path=$(find /home/ -type d -name "$dir" 2>/dev/null)
  if [[ -z "$dir_path" ]]; then
    echo "Dicho directorio no existe en el sistema"
    return
  fi
  ls -lah "$dir_path"
}

crear_directorio()
{
  read -p "Especifica el nombre del directorio que quieres crear: " dir_name
  read -p "Especifica la ruta donde quieres crear $dir_name: " ruta
  mkdir $ruta/$dir_name
}

borrar_directorio()
{
  read -p "Especifica en directorio que quieres borrar: " dir_name
  mapfile -t arrDir < <(find /home/ -type d -name "$dir_name" 2>/dev/null)
  for dir in "${arrDir[@]}"; do
    read -p "Se ha encontrado un directorio con el nombre $dir_name en $dir. Desea borrarlo? (s/n): " respuesta
    if [[ ${respuesta,,} == 's' ]]; then
      rm -rf $dir
    else
      continue
    fi
  done
}

crear_usuario()
{
  read -p "Especifica el nombre del usuario que quieres crear: " user_name
  sudo adduser $user_name
}

borrar_usuario()
{
  read -p "Especifica el usuario que quieres borrar: " user_name
  sudo userdel -r $user_name
}

while true; do
  echo "1. Listar archivos"
  echo "2. Ver directorios personales"
  echo "3. Crear directorio"
  echo "4. Borrar directorio"
  echo "5. Crear usuario"
  echo "6. Borrar usuario"
  echo "7. Salir"
  read -p "Introducir opción: " opt
  
  case $opt in
    1) listar_archivos;;
    2) ls -l /home/$USER ;; 
    3) crear_directorio;;  
    4) borrar_directorio;; 
    5) crear_usuario;;
    6) borrar_usuario;; 
    7) exit 0;;
    *) uso_programa;;
  esac
done
