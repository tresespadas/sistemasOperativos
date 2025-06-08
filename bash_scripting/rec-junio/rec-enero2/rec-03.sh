#!/usr/bin/env bash

### datos.sh ###

uso_script()
{
  echo "Los parámetros NO son los correctos [n,p,t]" >&2
  exit 1
}

existe_fichero()
{
  fich_path=$(find /home/ -type f -name "$1" 2>/dev/null)
  if [[ -z "$fich_path" ]]; then
    echo "El fichero $1 no existe se procede a crearlo..."
    echo "Se añade la fecha actual..."
    echo "El login del usuario que lo ejecuta.."
    echo "Se le otorgan los permisos rw-r--r--"
    echo "La fecha actual es: $(date +%d" de "%B" de "%Y)" >> $1
    echo "El login del usuario que ejecuta el script es: $USER" >> $1
    return 1
  else
    return 0
  fi
}

while getopts ':n:p:t:' opt; do
  case $opt in
  n|p|t)
    existe_fichero $OPTARG
    if [[ $? -eq 0 ]]; then
      fich_path=$(find /home/ -type f -name "$OPTARG" 2>/dev/null)
      case $opt in
        n)
          lineas=$(wc -l $fich_path | awk '{ print $1 }')
          echo "El número de líneas del fichero $OPTARG es: "$lineas
          exit 0
          ;;
        p)
          permisos=$(ls -l $fich_path | awk '{ print $1 }')
          echo "Los permisos del fichero $OPTARG son: "$permisos
          exit 0
          ;;
        t)
          less $fich_path
          exit 0
          ;;
      esac
    else
      exit 0
    fi
    ;;
  *) 
    uso_script
    ;;
  esac
done

uso_script
