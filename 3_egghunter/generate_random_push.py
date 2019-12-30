#!/usr/bin/python3

import random

rdm = bytearray(random.getrandbits(8) for _ in range(96))
for i in range(0,len(rdm),4):
	#for byte in i:
	#	print(''.join('{:02x}'.format(x) for x in byte))
	bts = rdm[i:i+4]
	print("\tpush 0x" + ''.join('{:02x}'.format(x) for x in bts))
		
