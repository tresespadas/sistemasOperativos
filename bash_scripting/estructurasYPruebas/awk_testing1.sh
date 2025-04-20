#!/bin/bash

read -p "Escoge un fichero: " fich

awk '{ nc += length($0) + 1; nw += NF } END { print NR, "lines,", nw, "words,", nc, "characters" }' $fich
