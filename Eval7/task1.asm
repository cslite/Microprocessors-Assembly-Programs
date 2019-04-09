.model tiny
;.386
.data
	rno db ?
	cno db ?
	cno2 db ?
	clim db 40
	clim2 db 80
	rlim db 25
.code
.startup
	;set video mode
	mov ah,0
	mov al,03h
	int 10h
	
	mov rno, 0
	mov cno, 0
	
rowagain:	
	;set cursor location
	mov ah,02h
	mov dh,rno
	mov dl,cno
	mov bh,0
	int 10h
	
	;write space
	mov ah,09h
	mov al,' '
	mov bh,0
	mov bl,00010001b
	mov cx,40
	int 10h
	
	add cno,40
	
	;set cursor location
	mov ah,02h
	mov dh,rno
	mov dl,cno
	mov bh,0
	int 10h
	
	;write space
	mov ah,09h
	mov al,' '
	mov bh,0
	mov bl,01110111b
	mov cx,40
	int 10h
	
	mov cno,0
	
	inc rno
	mov bl,rlim
	cmp rno,bl
	jl rowagain
	
	mov rno,0
	mov cno,0
	mov cno2,40
	mov ah,07h
	jmp x1
	
x2:
	;set cursor location
	mov ah,02h
	mov dh,rno
	mov dl,cno
	mov bh,0
	int 10h
	
	;write character
	mov ah,09h
	mov bh,0
	mov bl,00011110b
	mov cx,1
	int 10h
	
	;set cursor location
	mov ah,02h
	mov dh,rno
	mov dl,cno2
	mov bh,0
	int 10h
	
	;write character
	mov ah,09h
	mov bh,0
	mov bl,01111010b
	mov cx,1
	int 10h
	
	inc cno
	inc cno2
	
	mov bl,clim
	cmp cno,bl
	jl x1b
	mov cno,0
	mov cno2,40
	
x1b:	
	mov ah,07h
x1:
	int 21h
	cmp al,'$'
	jnz x2
	int 21h
	cmp al,'%'
	jnz x2
	
	mov ah,0
	mov al,3
	int 10h
.exit
end
	
	
