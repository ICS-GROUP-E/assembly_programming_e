section .data
    newline db 10

section .bss
    digit resb 1

section .text
    global _start

_start:
    mov esi, 1                  ; Initialize counter

loop_body:
    ; Convert number to ASCII
    mov eax, esi
    add al, '0'
    mov [digit], al

    ; Print number
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, digit
    mov edx, 1
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    inc esi

    cmp esi, 6
    jl loop_body

    ; Exit
    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
