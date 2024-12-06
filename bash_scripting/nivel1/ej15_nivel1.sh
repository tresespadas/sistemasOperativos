#!/bin/bash

while getopts "e:m:" arg; do
  case $arg in 
    e) sh ./$OPTARG;;
    m) cat ./$OPTARG;;
  esac
done
