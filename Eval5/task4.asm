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
	
	mov bl,-1	;EOF
	lea dx,buff
	dec dx
readmore:
	inc dx
	call read1
	mov si, dx
	cmp bl,byte ptr[si]
	jne readmore
	
	mov bx,fh
	call close

	lea dx,buff
	mov ah,09h
	int 21h
	
err:
.exit

read1 proc near uses cx ax bx
	mov ah,3fh
	mov bx,fh
	mov cx,1
	int 21h
	jc err
	ret
read1 endp

open proc near
	mov ah, 3dh		;function code for open
	mov al,00h		;access code for READ only
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
