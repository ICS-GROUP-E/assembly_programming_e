BITS 32
section .data
    msg1 db "Welcome to Assembly!", 10
    len1 equ $ - msg1

    msg2 db "Learning NASM macros.", 10
    len2 equ $ - msg2

    msg3 db "One macro, multiple messages.", 10
    len3 equ $ - msg3

section .text
    global _start

%macro PRINT 2
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

_start:
    PRINT msg1, len1
    PRINT msg2, len2
    PRINT msg3, len3

    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
