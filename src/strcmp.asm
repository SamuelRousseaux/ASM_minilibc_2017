[BITS 64]

global strcmp

section .text

strcmp:
	mov	rcx, 0

loop:
	mov	r8b, [rdi + rcx]
	mov	r9b, [rsi + rcx]
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
