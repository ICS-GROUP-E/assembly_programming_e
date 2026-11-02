section .data
    star db "*"
    newline db 10

section .text
    global _start

_start:
    mov ecx, 3

outer_loop:
    push ecx

    mov ecx, 2

inner_loop:
    push ecx

    ; Print *
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, star
    mov edx, 1
    int 0x80


    pop ecx

    loop inner_loop    

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80


    pop ecx

    loop outer_loop    

    ; Exit
    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
