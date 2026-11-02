BITS 32
section .data
    zero_msg db "Number is zero.", 10
    zero_len equ $ - zero_msg

    nonzero_msg db "Number is not zero.", 10
    nonzero_len equ $ - nonzero_msg

section .text
    global _start

%macro CHECK_ZERO 1
    test %1, %1
    jz %%zero

    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, nonzero_msg
    mov edx, nonzero_len
    int 0x80

    jmp %%done

%%zero:
    mov eax, 4
    mov ebx, 1
    mov ecx, zero_msg
    mov edx, zero_len
    int 0x80

%%done:
%endmacro

_start:
    mov ebx, 0
    CHECK_ZERO ebx

    mov ebx, 25
    CHECK_ZERO ebx

    mov ebx, 100
    CHECK_ZERO ebx

    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
