.model tiny
.data
	array1 db 45H,54H,0F4H,56H,99H,0F9H,0F0H,87H,66H,23H,54H,0F3H,0F6H,9CH,0FEH
	great1 db ?
.code
.startup
	lea si, array1
	lea di, great1
	mov bl, [si]
	mov cx, 15
x1:	cmp bl, [si]
	ja  x2
	mov bl, [si]
x2:	inc si
	dec cx
	jnz x1 
	mov [di], bl
.exit
end
