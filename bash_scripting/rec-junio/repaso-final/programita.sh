#!/usr/bin/env bash

variable="$1"
echo "${variable#/}"
echo "${variable##/}"
echo "$(basename "$1"}"
