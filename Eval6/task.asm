.model tiny
.data
	mytxt db 'DOLL$'
	ccol db ?
.code
.startup
	
	;set display mode
	mov ah, 0
	mov al, 03h
	int 10h

	;set cursor position
	mov ah,02h
	;valid column values are from 0 to 79
	mov dl,38	;set column at the mid location
	mov ccol, dl
	;valid row values are from 0 to 24
	mov dh,12	;set row at the mid location
	mov bh,0
	int 10h
	
	lea si, mytxt
wa:	mov al,[si]
	cmp al,'$'
	jz over
	;write character at cursor position
	mov ah,09h
	mov bh,0
	mov bl, 10001111b	;attribute
		;mov bl,8fh ;hex form of 10001111 (attribute)
	mov cx,1
	int 10h
	;move si and cursor to next position
	inc si
	mov ah,02h
	mov dh,12
	inc ccol
	mov dl,ccol
	mov bh,0
	int 10h

	jmp wa

over:
	mov ah,07h
x1: 
	int 21h
	cmp al,'q'
	jnz x1
.exit
end
