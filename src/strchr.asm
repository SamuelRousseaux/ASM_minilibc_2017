[BITS 64]

global strchr

section .text

strchr:
	cmp	byte[rdi], sil		; if rdx == char
	jz	good_end		; then jump to end
	cmp	byte[rdi], 0  		; if rdx == 0
	jz	bad_end    		; then not found
	inc	rdi		    	; rdx += 1
	jmp	strchr		    	; loop

bad_end:
	mov	rax, 0		; set return to null
	ret

good_end:
	mov	rax, rdi		; set return to ptr addr
	ret
