BITS 32
section .data
    msg db "Register operations completed.", 10
    len equ $ - msg

section .text
    global _start


%macro INCREMENT 1
    inc %1
%endmacro


%macro DECREMENT 1
    dec %1
%endmacro

_start:
    mov eax, 10
    mov ebx, 20

    INCREMENT eax
    INCREMENT eax
    INCREMENT eax

    DECREMENT ebx
    DECREMENT ebx

    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
