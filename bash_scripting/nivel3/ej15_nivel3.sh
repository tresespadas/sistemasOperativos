#!/bin/env bash

list_file() {
  echo -e "Listando los archivos en $(pwd)...\n"
  sleep 0.5
  ls -lah .
  echo
}

list_dir() { # Duda: Ver directorios de trabajo? Todos los /home/ ?
  echo -e "Listando el directorio personal del usuario $(whoami) en $HOME\n"
  sleep 0.5
  ls -lah $HOME
  echo
}

make_dir() { # Nota: Lo crea en el mismo directorio de trabajo
  echo
  read -p "Especifica el nombre del nuevo directorio: " name_dir
  echo "Creando un directorio llamado "$name_dir" en $(pwd)..."
  mkdir "$name_dir"
  echo
}

delete_dir() { # Nota: Lo busca en el mismo directorio de trabajo
  echo
  read -p "Especifica el nombre del directorio que quieres borrar: " name_dir
  if [ ! -d "$name_dir" ]; then
    echo "El directorio que has especificado no existe"
    break;
  else
    rm -rf "$name_dir"
    echo "Se ha borrado el directorio $name_dir"
  fi
  echo
}

while true; do
  echo "*** Menú ***"
  echo "1. Listar archivos"
  echo "2. Ver directorios de trabajo"
  echo "3. Crear directorio"
  echo "4. Borrar directorio"
  echo "5. Crear usuario"
  echo "6. Borrar usuario"
  echo "7. Salir"
  read -p "Introducir opción: " opt

  case "$opt" in
    1) list_file;
    ;;
    2) list_dir;
    ;;
    3) make_dir;
    ;;
    4) delete_dir;
    ;;
    5) make_user;
    ;;
    6) del_user;
    ;;
    7) exit 0;
    ;;
    *) 
      echo "Opción inválida";
      exit 1 
    ;;
  esac
done
