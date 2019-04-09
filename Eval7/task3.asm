.model tiny
.data
	row dw 0
	col dw 0
	rows dw 250
	cols dw 150
	r dw 0
	cq dw 0
	color1 db ?
	color2 db ?
	color db ?
.code
.startup
	mov ah,0
	mov al,12h
	int 10h
	
fir:
	mov cx,10
z1:
	mov bx,cq
	mov col,bx
	mov bx,r
	mov row,bx
	mov color,0101b
	call fill
	
	inc r
	inc cq
	dec rows
	dec cols
	mov bx,cq
	mov col,bx
	cmp bx,cols
	jge over
	
	mov bx,r
	mov row,bx
	
	cmp bx,rows
	jge over
	
	loop z1
	
	mov cx,10
z2:
	mov bx,cq
	mov col,bx
	mov bx,r
	mov row,bx
	mov color,0010b
	call fill
	
	inc r
	inc cq
	dec rows
	dec cols
	mov bx,cq
	mov col,bx
	cmp bx,cols
	jge over
	mov bx,r
	mov row,bx
	
	cmp bx,rows
	jge over
	loop z2
	jmp fir
over:	
	mov ah,07h
x1:
	int 21h
	cmp al,'q'
	jnz x1
.exit

fill proc near uses ax bx cx
	
again:
	mov ah,0ch
	mov al,color
	mov cx,col
	mov dx,row
	int 10h
	
	inc col
	mov bx,cols
	cmp col,bx
	jl again
	
	inc row
	dec col
	
again2:
	mov ah,0ch
	mov al,color
	mov cx,col
	mov dx,row
	int 10h
	
	inc row
	mov bx,rows
	cmp row,bx
	jl again2

	dec row
	dec col
	
again3:
	mov ah,0ch
	mov al,color
	mov cx,col
	mov dx,row
	int 10h
	
	dec col
	mov bx,cq
	cmp col,bx
	jge again3

	inc col
	dec row
	
again4:
	mov ah,0ch
	mov al,color
	mov cx,col
	mov dx,row
	int 10h
	
	dec row
	mov bx,r
	cmp row,bx
	jge again4
	
	ret
fill endp

end
