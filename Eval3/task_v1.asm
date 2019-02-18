.model tiny
.data
	dat1 db 'math$','have$','    $','bury$','mine$','dine$','    $','hell$','deep$','tree$'
	cnt db 10
.code
.startup
	lea di, dat1
	mov bl, '$'
	mov bh, ' '
	dec di
	mov ch, cnt
x2:	mov cl, 4
x1:	inc di
	dec cl
	jz rev
	cmp bh, byte ptr[di]
	jz x1
	cmp bl, byte ptr[di]
	jnz x7 
	dec ch
	jz x5
x7:	jmp x2
rev: inc di
	 cmp bl, byte ptr[di]
	 jnz x8
	 dec ch
	 jz x5
x8:	 inc di
	 cmp bh, byte ptr[di]
	 jz x3
x6:	 mov si,3
	 add si,di
	 mov dl,[si]
	 mov dh,[di]
	 mov [si],dh
	 mov [di],dl
	 inc di
	 dec si
	 mov dl,[si]
	 mov dh,[di]
	 mov [si],dh
	 mov [di],dl
	 add di,2
	 jmp rev
x3:	mov cl,4
	mov si, di
	dec si
x4:	inc si
	dec cl
	jz x5
	cmp bh, byte ptr[si]
	jz x4
	jmp x6
x5: mov cx,0
.exit
end
