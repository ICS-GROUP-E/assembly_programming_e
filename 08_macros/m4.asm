BITS 32
section .data
    msg db "Hello!", 10
    len equ $ - msg

section .text
    global _start

%macro PRINT_FIVE_TIMES 0
    %rep 5
        mov eax, 4               ; sys_write
        mov ebx, 1               ; stdout
        mov ecx, msg
        mov edx, len
        int 0x80
    %endrep
%endmacro

_start:
    PRINT_FIVE_TIMES

    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
