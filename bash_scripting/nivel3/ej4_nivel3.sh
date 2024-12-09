#!/bin/bash

read -p "Directorio destino: " dir

check_dir=$(find / -type d -name "$dir" 2>/dev/null | grep "$dir") # Solo vale el exacto

