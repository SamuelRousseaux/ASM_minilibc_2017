[BITS 64]

global strlen

section .text

strlen:
	mov	rcx, 0		; set counter to 0

loop:
	cmp	byte[rdi + rcx], 0  ; if str[rcx] == 0
	jz	end		    ; then go to end
	inc	rcx		    ; rcx += 1
	jmp	loop		    ; loop

end:
	mov	rax, rcx		; set return to counter value
	ret
