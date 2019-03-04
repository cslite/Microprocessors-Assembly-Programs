.model tiny
.data
	fname db 'myinfo.txt',0	;asciz string for filename
	myname db 'AV BITSIAN',0ah
	myid db '201ZBXAY0000P', 0ah ,'$'
	maxlen db 32
	buff db 32 dup('$')		;buff to be written in file
	fh dw ?
.code
.startup
	mov cx,0	;for normal file
	mov ah,3ch	;function code for create
	lea dx,fname ;filename offset in dx
	int 21h		;file will be created
	jc err

	mov dx, offset fname 	;filename offset in dx
	call open
	mov fh,ax		;move filehandle to fh
		
	lea di,myname
	mov cx,2
x1:	
	call write
	loop x1

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
