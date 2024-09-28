.model small
.stack 100h
.data

str01 db "ENTER FIRST NUMBER$"
str02 db "ENTER FIRST NUMBER:$"
str2 db "ERROR SUM IS GREATER THAN 9$"
str3 db "SUM IS: $"

.code 
	main proc
	
	mov ax , @data
	mov ds , ax
	mov dx , offset str01
	mov ah , 09h
	int 21h

	mov ah , 01h
	int 21h
	
	mov bl , al
	sub bl, 30h


	mov dl , 10 
	mov ah , 02h
	int 21h
	
	mov dl , 13
	mov ah , 02h
	int 21h
	
	mov dx , offset str02
	mov ah , 09h
	int 21h

	mov ah , 01h
	int 21h
	
	mov cl , al
	sub cl, 30h
	
	add bl , cl
		
	mov dl , 10 
	mov ah , 02h
	int 21h
	
	mov dl , 13
	mov ah , 02h
	int 21h

	cmp bl , 9
	jb aa

	mov dx , offset str2
	mov ah , 09h
	int 21h
	jmp exit
	
aa: mov dx , offset str3
	mov ah , 09h
	int 21h
	
	add bl, 30h
	mov dl , bl
	mov ah , 02h
	int 21h	
	
	
exit:	mov ah , 4ch
	int 21h

main endp
end main