.model small
.stack 100h

.data
    input_string db 20 dup('$')
    prompt_message db 10, 13, "Enter a string: $"
    output_message db 10, 13, "New string is: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, prompt_message
    mov ah, 09h
    int 21h

    mov si, offset input_string

input_loop:
    mov ah, 01h
    int 21h

    cmp al, 13
    je input_taken

    mov [si], al
    inc si
    jmp input_loop

input_taken:
    lea dx, output_message
    mov ah, 09h
    int 21h

    mov si, offset input_string
    mov cx, 0

print_loop:
    mov al, [si]

    cmp al, '$'
    je print_word

    cmp al, ' '
    je print_word

    inc si
    inc cx
    jmp print_loop

print_word:
    mov di, si
    dec di

print_char_loop:
    mov dx, [di]
    mov ah, 02h
    int 21h

    dec di

    dec cx
    jnz print_char_loop

    mov al, [si]
    cmp al, '$'
    je exit

    mov dx, ' '
    mov ah, 02h
    int 21h

    inc si
    jmp print_loop

exit:
    mov ah, 4ch
    int 21h

main endp
end main