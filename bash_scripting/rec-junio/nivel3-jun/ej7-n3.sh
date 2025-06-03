#!/usr/bin/env bash

### menú_fichero ###

uso_script()
{
  echo "Elige una de las 3 opciones que se muestran en pantalla. Este programa no admite parámetros de entrada."
  exit 1
}

borrar_fichero()
{
  read -p "¿Qué fichero quieres borrar?:" fichero
  mapfile -t arrFicheros < <(find /home/ -type f -name "$fichero" 2>/dev/null)

  if [[ "${#arrFicheros[@]}" -eq 0 ]]; then
    echo "No se ha encontrado el fichero especificado..."
    return
  fi

  for elemento in "${arrFicheros[@]}"; do
    echo -e "Se ha encontrado el siguiente fichero: '$elemento'\n¿Desea borrarlo? (s/n) " 
    read respuesta
    if [[ "$respuesta" == 'S' || "$respuesta" == 's' ]]; then
      rm "$elemento"
    else
      continue
    fi
  done
}

imprimir_fichero()
{
  read -p "¿Qué fichero quieres mostrar?:" fichero
  mapfile -t arrFicheros < <(find /home/ -type f -name "$fichero" 2>/dev/null)

  if [[ "${#arrFicheros[@]}" -eq 0 ]]; then
    echo "No se ha encontrado el fichero especificado..."
    return
  fi

  for elemento in "${arrFicheros[@]}"; do
    echo -e "Se ha encontrado el siguiente fichero: '$elemento'\nMostrando su contenido... " 
    cat "$elemento"
  done

}

if [[ "$#" -ne 0 ]]; then
  uso_script
fi

while true; do
  echo "1.- Borrar un fichero"
  echo "2.- Imprimir un fichero"
  echo "3.- Salir"
  read -p "Elige una opción: " opcion
  case "$opcion" in
    1) borrar_fichero;;
    2) imprimir_fichero;;
    3) exit 0;;
    *) uso_script;;
  esac
done
