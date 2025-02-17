#!/bin/bash

read -p "" char

if [[ $char =~ y|Y ]]; then
  echo "YES"
elif [[ $char =~ n|N ]]; then
  echo "NO"
fi
