;smaller and easier to understand code
.model tiny
.386
.data
	dat1 db 'math','have','    ','bury','mine','dine','    ','hell','deep','tree'
	cnt db 10
	ans db 0
.code
.startup
		lea di, dat1
		mov eax, '    '
		xor ecx, ecx
		mov cl,cnt
repne	scasd
		cmp cl,0
		jz x2
		inc ans
x3:		mov bx,[di]
		mov dx,[di+2]
		rol bx,8
		rol dx,8
		push bx
		push dx
		pop word ptr[di]
		pop word ptr[di+2]
		add si,4
		scasd
		jz x1
		dec cl
		jz x2
		jmp x3
x1:		inc ans
x2:		xor eax,eax
		mov al, ans		;al now stores the number of occurrences of '4 blank spaces'
.exit
end
