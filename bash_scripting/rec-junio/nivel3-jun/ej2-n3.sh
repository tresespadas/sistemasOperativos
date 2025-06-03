#!/usr/bin/env bash

### orden_usuarios ###

awk -F ':' '$3 >= 1000 {print "-Usuario: "$1" -Directorio personal: "$6" -Shell: "$NF}' /etc/passwd | sort
