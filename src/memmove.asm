[BITS 64]

global memmove

section .text

memmove:
	mov	rcx, 0

copy_reg:
	cmp	rcx, rdx
	jge	reinit
	mov	r11b, byte[rsi + rcx]
	mov	[r13 + rcx], r11b
	inc	rcx
	jmp	copy_reg

reinit:
	mov	rcx, 0

copy_back:
	cmp	rcx, rdx
	jge	end
	mov	r11b, byte[r13 + rcx]
	mov	[rdi + rcx], r11b
	inc	rcx
	jmp	copy_back

end:
	mov	rax, rdi
	ret
