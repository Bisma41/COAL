.model small
.stack 100h

.data
str1 db 50 dup(?)
str2 db "Enter a String:$"
str3 db "No. of Vowels in the string are:$"

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset str2
    mov ah, 09h
    int 21h

    mov si, offset str1

    mov bl, 0

count_vowels:
    inc bl

input_loop:
    mov ah, 01h
    int 21h

    cmp al, 13
    je print_vowel_count

    mov [si], al
    inc si

    cmp al, 'a'
    je count_vowels
    cmp al, 'e'
    je count_vowels
    cmp al, 'i'
    je count_vowels
    cmp al, 'o'
    je count_vowels
    cmp al, 'u'
    je count_vowels

    jmp input_loop

print_vowel_count:
    dec bl
    add bl, 30h

    mov dx, offset str3
    mov ah, 09h
    int 21h

    mov dl, bl
    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h

main endp
end main