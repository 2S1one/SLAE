	; after launching bind_tcp_staged execute: printf '\x31\xc0\xb0\x01\x31\xdb\xbb\x64\x00\x00\x00\xcd\x80' | nc localhost 5555
	section .text
global _start

_start:
	xor eax, eax
	mov al, 1
	xor ebx, ebx
	mov ebx, 100
	int 0x80
