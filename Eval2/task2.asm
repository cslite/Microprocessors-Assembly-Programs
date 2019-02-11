.model tiny
.data
dat1 dw 0EF45H, 4554H, 0F467H, 9999H, 8F98H, 8766H, 2353H, 5678H,9900H, 0FC44H
count db 0ah
neg1 db ?
.code
.startup
	lea si, dat1
	lea di, count
	mov bx, [di]
	mov cl, 0
	mov ax, 0
x1:	cmp [si], ax 
	jge x2
	inc cl 
x2: inc si
	inc si
	dec bx
	jnz x1 
	mov neg1, cl
.exit
end
