BITS 32
section .text
    global _start

_start:
    mov eax, 10
    call calculate

after_call:
    ; EAX should now be 15
    nop

    mov eax, 1
    xor ebx, ebx
    int 0x80

calculate:
    add eax, 5
    ret
