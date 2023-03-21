; This is the main coding file. I will be using this to code everything I learn / am trying
BITS 64 ; tell nasm this is 64 bit code

global _start

section .text
    _start:
        call _func          ; Call the label _func
        mov rax, 60         ; Moving 60 into the rax registery
        syscall             ; Calling the system kernal
    _func:
        mov     rdi, 0      ; Moving 0 into the rdi registry
        ret