[BITS 64]

global memcpy

section .text

memcpy:
	mov	rcx, 0

loop:
	cmp	rcx, rdx
	jz	end
	mov	r8b, [rsi + rcx]
	mov	[rdi + rcx], r8b
	inc	rcx
	jmp	loop

end:
	mov 	rax, rdi
	ret
