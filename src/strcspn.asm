[BITS 64]

global strcspn

section .text

strcspn:
	mov	r10, 0

loop:
	cmp	byte[rdi], 0
	jz	end
	mov	r8, rsi
	jmp	secondary_loop

secondary_loop:
	cmp	byte[r8], 0
	jz	restart_loop
	mov	r9b, [rdi]
	cmp	[r8], r9b
	jz	end
	inc	r8
	jmp	secondary_loop

restart_loop:
	inc	rdi
	inc	r10
	jmp	loop

end:
	mov	rax, r10
	ret
