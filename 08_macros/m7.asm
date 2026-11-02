BITS 32
section .data
    msg1 db "First line"
    len1 equ $ - msg1

    msg2 db "Second line"
    len2 equ $ - msg2

    newline db 10

section .text
    global _start


%macro PRINT 2
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro


%macro PRINT_LINE 2
    PRINT %1, %2
    PRINT newline, 1
%endmacro

_start:
    PRINT_LINE msg1, len1
    PRINT_LINE msg2, len2

    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
