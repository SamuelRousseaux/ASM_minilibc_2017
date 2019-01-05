[BITS 64]

global strstr

section .text

strstr:
	mov	rcx, 0
	mov	rdx, 0

loop:
	mov	r8b, [rdi + rcx]
	mov	r9b, [rsi]
	cmp	r8b, r9b
	jz	start_compare
	cmp	r8b, 0
	jz	end
	cmp	r9b, 0
	jz	end
	inc	rcx
	jmp	loop		    	; loop

start_compare:
	push	rcx
	mov	r10, 0
	jmp	compare

compare:
	mov	r8b, [rdi + rcx]
	mov	r9b, [rsi + r10]
	cmp	r9b, 0
	jz	good_compare
	cmp	r8b, r9b
	jnz	bad_compare
	inc	rcx
	inc	r10
	jmp	compare

bad_compare:
	pop	rcx
	inc	rcx
	jmp	loop


good_compare:
	pop	rcx
	add	rdi, rcx
	mov	rax, rdi
	ret
end:
	mov 	rax, 0
	ret
