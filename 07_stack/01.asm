BITS 32
section .text
    global _start

_start:
    mov eax, 100
    mov ebx, 200

    push eax
    push ebx
    nop

    pop ecx
    pop edx
    nop

    mov eax, 1
    xor ebx, ebx
    int 0x80
