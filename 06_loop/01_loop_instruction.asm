section .data
    message db "Hello, Assembly!", 10
    length equ $ - message

section .text
    global _start

_start:
    mov ecx, 5                  ; Repeat 5 times

repeat:
    ; Print the message
    push ecx                    ; int 0x80 uses ECX for the buffer address
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, message
    mov edx, length
    int 0x80
    pop ecx

    loop repeat

    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
