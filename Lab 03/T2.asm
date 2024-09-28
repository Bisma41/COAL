
.model small
.stack 100h
.data

str1 db "Enter two Values:$"
str2 db "Enter operation: $"
str3 db "sum is: $"
str4 db "difference is: $"

.code 
	main proc
	
	mov ax , @data
	mov ds , ax
	mov dx , offset str1
	mov ah , 09h
	int 21h
	
	mov ah , 01h
	int 21h
	
	mov bl , al
	
	mov ah , 01h
	int 21h
	
	mov cl , al

	mov dl, 10
	mov ah, 2
	int 21h
	mov dl, 13
	mov ah, 2
	int 21h
	
	mov dx , offset str2
	mov ah , 09h
	int 21h
	
	mov ah , 01h
	int 21h
	
	mov bh , al
		
	cmp bh , '+'
	je aa
	sub bl , cl
	add bl, 30h
	
	mov dl, 10
	mov ah, 2
	int 21h
	mov dl, 13
	mov ah, 2
	int 21h

	mov dx , offset str4
	mov ah , 09h
	int 21h
	
	mov dl , bl
	mov ah , 02h
	int 21h	
	jmp exit
	
aa: add bl , cl
	sub bl , 30h
	
	mov dl, 10
	mov ah, 2
	int 21h
	mov dl, 13
	mov ah, 2
	int 21h

	mov dx , offset str3
	mov ah , 09h
	int 21h
	
	mov dl , bl
	mov ah , 02h
	int 21h	
	
exit:	
    mov ah , 4ch
	int 21h

main endp
end main
