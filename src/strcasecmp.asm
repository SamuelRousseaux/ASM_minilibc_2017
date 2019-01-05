[BITS 64]

global strcasecmp

section .text

strcasecmp:
	mov	rcx, 0

start_loop1:
	mov	r8b, [rdi + rcx]
	cmp	r8b, 65
	jl	start_loop2
	cmp	r8b, 90
	jl	lower1

start_loop2:
	mov	r9b, [rsi + rcx]
	cmp	r9b, 65
	jl	compare_ch
	cmp	r9b, 90
	jl	lower2

compare_ch:
	cmp	r8b, r9b
	jnz	end
	cmp	r8b, 0
	jz	end
	cmp	r9b, 0
	jz	end
	inc	rcx
	jmp	start_loop1

lower1:
	add	r8b, 32
	jmp	start_loop2

lower2:
	add	r9b, 32
	jmp	compare_ch

end:
	sub	r8b, r9b
	movsx	rax, r8b
	ret
