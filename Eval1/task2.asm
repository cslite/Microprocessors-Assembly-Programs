.model tiny
.data
array1 db 50 DUP(99H)
.code
.startup
	lea si , array1
	mov cx , 0032H
x1:	mov ah , [si]
	mov [si+60] , ah
	inc si
	inc di
	dec cx
	jnz x1
.exit
end
