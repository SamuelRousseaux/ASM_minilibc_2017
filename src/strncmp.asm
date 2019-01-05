[BITS 64]

global strncmp

section .text

strncmp:
	mov	rcx, 0
	cmp	rdx, 0
	jz	end_zero

loop:
	dec	rdx
	mov	r8b, [rdi + rcx]
	mov	r9b, [rsi + rcx]
	cmp	rdx, 0
	jz	end
	cmp	r8b, r9b
	jnz	end
	cmp	r8b, 0
	jz	end
	cmp	r9b, 0
	jz	end
	inc	rcx
	jmp	loop		    	; loop

end:
	sub	r8b, r9b
	movsx 	rax, r8b	; set return to ptr addr
	ret

end_zero:
	mov	rax, 0
	ret
