.model tiny
.data
	fname db 'myinfo.txt',0	;asciz string for filename
	maxlen db 150
	buff db 150 dup('$')		;buff to be written in file
	sz dw ? 
	fh dw ?
.code
.startup
	lea dx,fname
	call open
	mov fh,ax

	mov ah,42h
	mov al,02h
	mov bx,fh
	mov cx,0
	mov dx,0
	int 21h	;now file pointer will be at last position
	jc err
	mov sz,ax

	mov ah,42h
	mov al,00h
	mov bx,fh
	mov cx,0
	mov dx,0
	int 21h
	jc err

	mov ah,3fh
	mov bx,fh
	lea dx,buff
	mov cx,sz
	int 21h
	jc err

	mov bx,fh
	call close

	lea dx,buff
	mov ah,09h
	int 21h

err:
.exit

open proc near
	mov ah, 3dh		;function code for open
	mov al,00h		;access code for write only
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

end
