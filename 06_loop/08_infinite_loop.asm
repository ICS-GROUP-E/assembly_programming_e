section .data
    message db "Running...", 10
    length equ $ - message

section .text
    global _start

_start:
repeat:
    ; Print message
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, message
    mov edx, length
    int 0x80

    jmp repeat                 ; Jump back unconditionally
