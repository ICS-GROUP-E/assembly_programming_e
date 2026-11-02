section .data
    message db "Sum = "
    length equ $ - message
    newline db 10

section .bss
    result resb 2

section .text
    global _start

_start:
    mov esi, 1
    mov edi, 0

sum_loop:
    add edi, esi
    inc esi

    cmp esi, 6
    jl sum_loop                


    mov eax, edi
    mov ebx, 10
    xor edx, edx
    div ebx

    add al, '0'
    mov [result], al

    add dl, '0'
    mov [result + 1], dl

    ; Print message
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, message
    mov edx, length
    int 0x80

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit
    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
