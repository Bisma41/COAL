.model small
.stack 100h
.data
    msg1 db 'Enter a string: $'
	msg2 db 'In reverse order: $'
	str1 db 20 dup('$')

.code
main proc
	mov ax, @data
	mov ds, ax
	mov dx,offset msg1
	mov ah,09h
	int 21h
	mov si, offset str1
	mov cx, 0
	mov dx,offset msg2
	mov ah,09h
	int 21h
again:
	mov ah, 01h
	int 21h
	inc cx
	cmp al, 13
	je jump
	mov [si], al
	inc si
	jmp again	
jump:	
	dec si
	dec cx
reverse_loop:	
	mov dl, [si]
	mov ah, 02h
	int 21h
	dec si
	dec cx
	jne reverse_loop
    mov ah, 4ch
    int 21h
main endp
end main

	
