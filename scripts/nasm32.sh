#!/bin/bash

if [ -z $1 ]; then
  echo "Usage ./nasm32 <nasmMainFile> (no extension)"
  exit
fi

if [ ! -e "$1.asm" ]; then
  echo "Error, $1.asm not found."
  echo "Note, do not enter file extensions"
  exit
fi

nasm -f elf $1.asm -o $1.o
ld -m elf_i386 -o $1 $1.o
