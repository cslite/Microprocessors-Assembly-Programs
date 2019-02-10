.model tiny
.data
dat1 db 20H,21H,22H,23H,24H
dat2 db 30H,31H,32H,33H,34H
.code
.startup
	mov si , offset dat1
	mov di , offset dat2
	mov cx , 0005H
x1:	mov ah , [si]
	add ah , [di]
	mov [di+20] , ah
	inc si
	inc di
	dec cx
	jnz x1
.exit
end
