.model tiny
.386
.data
	fstr db 'Enter User Name', 0Ah, '$'
	pstr db 'Enter Password',0ah,'$'
	user db 'bits$'
	lenu equ $-user
	pass db 'ipc$'
	lenp equ $-pass
	hello db 'Hello $'
	max1 db 32
	act1 db ?
	inp1 db 32 dup(?)
	last db '$'
.code
.startup
	lea si,user
	lea dx,fstr
	call print
	call input
	mov cx, lenu
	dec cx	;as its size also includes $
	movzx bx,act1
	cmp cx,bx
	jne over
	lea si,user
	lea di,inp1
	cld
	inc cx
cr1: 
	dec cx
	cmpsb
	je cr1
	cmp cx,0
	jne over
	lea dx,pstr
	call print
	call input
	mov cx,lenp
	dec cx
	movzx bx,act1
	cmp cx,bx
	jne over
	lea si,pass
	lea di,inp1
	cld
	inc cx
cr:
	dec cx
	cmpsb
	je cr
	cmp cx,0
	jne over
	lea dx,hello
	call print
	lea dx,user
	call print
over: mov ax,0
.exit

print proc near uses ax
	mov ah,09h
	int 21h
	ret
print endp

input proc near uses dx ax
	lea dx,max1
	mov ah,0ah
	int 21h
	ret
input endp

cnt proc near uses cx dx
	mov dl,'$'
	mov bl,0
	movzx cx,max1
x1: inc bl
	cmp dl,[si]
	jne x1
	dec bl
	ret
cnt endp
end
