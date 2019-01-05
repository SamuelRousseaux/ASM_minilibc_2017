[BITS 64]

global memset

section .text

memset:
	mov	rcx, 0

loop:
	cmp	rcx, rdx
	jz	end
	mov	[rdi + rcx], sil
	inc	rcx
	jmp	loop		    	; loop

end:
	mov 	rax, rdi	; set return to ptr addr
	ret
