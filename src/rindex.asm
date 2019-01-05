[BITS 64]

global rindex

section .text

rindex:
	mov	rcx, 0

strlen:
	cmp	byte[rdi + rcx], 0
	jz	loop
	inc	rcx
	jmp	strlen

loop:
	mov	r8b, [rdi + rcx]
	cmp	r8b, sil
	jz	good_end
	cmp	rcx, 0
	jz	bad_end
	dec	rcx
	jmp	loop

bad_end:
	mov	rax, 0
	ret

good_end:
	add	rdi, rcx
	mov 	rax, rdi
	ret
