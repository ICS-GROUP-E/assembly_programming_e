BITS 32
section .data
    msg1 db "Addition: "
    len1 equ $ - msg1

    msg2 db "Subtraction: "
    len2 equ $ - msg2

    newline db 10

section .bss
    buffer resb 32

section .text
    global _start


%macro ADD_NUMBERS 2
    mov eax, %1
    add eax, %2
%endmacro

%macro SUB_NUMBERS 2
    mov eax, %1
    sub eax, %2
%endmacro


print_number:
    lea esi, [buffer + 32]
    mov ebx, 10

.convert:
    xor edx, edx
    div ebx
    add dl, '0'
    dec esi
    mov [esi], dl
    test eax, eax
    jnz .convert

    lea edx, [buffer + 32]
    sub edx, esi

    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, esi
    int 0x80
    ret

; Print a newline.
%macro NEWLINE 0
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, newline
    mov edx, 1
    int 0x80
%endmacro

_start:
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ADD_NUMBERS 25, 15
    call print_number
    NEWLINE

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    SUB_NUMBERS 50, 20
    call print_number
    NEWLINE

    ; Exit.
    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
