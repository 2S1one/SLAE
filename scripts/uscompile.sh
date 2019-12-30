#!/bin/bash

if [ -z $1 ]; then
  echo "Usage ./compile <cFile> (no extension)"
  exit
fi

if [ ! -e "$1.c" ]; then
  echo "Error, $1.c not found."
  echo "Note, do not enter file extensions"
  exit
fi

gcc -masm=intel -m32 -ggdb -fno-stack-protector -z execstack -mpreferred-stack-boundary=2 -o $1 $1.c
