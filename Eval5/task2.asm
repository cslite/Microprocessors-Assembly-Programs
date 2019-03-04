.model tiny
.data
	fname db 'myinfo.txt',0
	hostel db 'XYZ Bhawan',0ah
	room db 'ABCD',0ah,'$'
	maxlen db 32
	buff db 32 dup('?')
	fh dw ?
.code
.startup
	mov dx, offset fname
	call open
	mov fh,ax

	mov ah,42h
	mov al,02h
	mov bx,fh
	mov cx,0
	mov dx,0
	int 21h	;now file pointer will be at last position

	lea di,hostel
	call write

	mov bx,fh
	call close
err:
.exit

strlen proc near uses ax cx di
	xor bx,bx
	mov bl,maxlen
	mov al,'$'
	xor cx,cx
	mov cl,maxlen
repne scasb
	sub bl,cl	;now bl contains the length of str
	dec bl
	ret
strlen endp

open proc near
	mov ah, 3dh		;function code for open
	mov al,01h		;access code for write only
	int 21h			;file will be opened
	jc err
	ret
open endp

close proc near
	mov ah,3eh
	int 21h
	jc err
	ret
close endp

write proc near uses cx ax dx
	call strlen
	mov cx,bx
	mov ah,40h
	mov bx,fh
	mov dx,di
	int 21h
	jc err
	ret
write endp
end
