BITS 32
section .data
    msg1 db "start ...", 10
    len1 equ $ - msg1
    
    msg2 db "stop ...", 10
    len2 equ $ - msg2

section .text
    global _start

%macro print 2
    mov eax, 4                  ; sys_write
    mov ebx, 1                  ; stdout
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

%macro delay 1
    mov ecx, %1
%%loop_delay:
    loop %%loop_delay
%endmacro

_start:
    print msg1, len1
    
    delay 1000000000
    
    print msg2, len2
    
    mov eax, 1                  ; sys_exit
    xor ebx, ebx
    int 0x80
