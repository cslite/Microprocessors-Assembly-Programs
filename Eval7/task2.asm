.model tiny
.data
	row dw 70
	col dw 80
	rows dw 150
	cols dw 180
	r dw 70
	cq dw 80
.code
.startup
	
	mov ah,0
	mov al,12h
	int 10h
again:
	mov ah,0ch
	mov al,0100b
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
	mov al,0100b
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
	mov al,0100b
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
	mov al,0100b
	mov cx,col
	mov dx,row
	int 10h
	
	dec row
	mov bx,r
	cmp row,bx
	jge again4
	
	mov ah,07h
x1:
	int 21h
	cmp al,'q'
	jnz x1
	
.exit
end
