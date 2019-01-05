[BITS 64]

global strpbrk

section .text

strpbrk:
	cmp	byte[rdi], 0
	jz	bad_end
	mov	r8, rsi
	jmp	secondary_loop

secondary_loop:
	cmp	byte[r8], 0
	jz	restart_loop
	mov	r9b, [rdi]
	cmp	[r8], r9b
	jz	good_end
	inc	r8
	jmp	secondary_loop

restart_loop:
	inc	rdi
	jmp	strpbrk

bad_end:
	mov 	rax, 0
	ret

good_end:
	mov	rax, rdi
	ret
