BITS 32
section .data
    msg db "Program completed successfully.", 10
    len equ $ - msg

section .text
    global _start

%macro PRINT 2
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro EXIT_PROGRAM 1
    mov eax, 1                  ; sys_exit
    mov ebx, %1
    int 0x80
%endmacro

_start:
    PRINT msg, len

    EXIT_PROGRAM 0
