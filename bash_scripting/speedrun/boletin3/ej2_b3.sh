#!/bin/bash

awk 'BEGIN { FS=":" } $3 >= 1000 { print $1,$6,$7 }' /etc/passwd | sort
