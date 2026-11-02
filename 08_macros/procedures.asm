BITS 32
section .data
    msg1 db "start ...", 10
    len1 equ $ - msg1

    msg2 db "stop ...", 10
    len2 equ $ - msg2

section .text
    global _start

print:
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, esi
    int 0x80
    ret

delay:
    mov ecx, ebx

loop_l:
    loop loop_l

    ret

_start:
    mov esi, msg1
    mov edx, len1
    call print

    mov ebx, 1000000000
    call delay

    mov esi, msg2
    mov edx, len2
    call print

    ; Exit program
    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
