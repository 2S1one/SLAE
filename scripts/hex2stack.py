#!/usr/bin/python3
# -*- coding: utf-8 -*-

import sys

if __name__ == '__main__':
	if len(sys.argv) != 2:
		print("Enter opcode in hex")
		sys.exit(0)

	string = sys.argv[1]

	reversed = [string[i:i+2] for i in range(0,len(string),2)][::-1]

	remainder = len(reversed) % 4
	if remainder:
		print("\tpush 0x" + "90"*(4-remainder) + "".join(reversed[0:remainder]))

	for p in range(remainder, len(reversed[remainder:]), 4):
		print("\tpush 0x" + "".join(reversed[p:p+4]))

