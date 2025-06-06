#!/usr/bin/env bash

### contador ###

if [[ $# -ne 1 ]]; then
  echo "Sólo se admite un parámetro: una palabra"
fi

palabra="$1"
cont_vocal=0
cont_consonante=0
for ((i=0; i<${#palabra}; i++)); do
  letra="${palabra:$i:1}"
  case "${letra,,}" in
    a|e|i|o|u)
      ((cont_vocal++))
      ;;
    ñ|q|w|r|t|y|p|s|d|f|g|h|j|k|l|z|x|c|v|b|n|m)
      ((cont_consonante++))
      ;;
    *)
      continue
      ;;
   esac
done 
echo ""$1" tiene $cont_vocal vocales y $cont_consonante consonantes"
