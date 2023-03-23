BITS 64

global _start

section .data
    blank db "", 0x0a
    prompt db "Type a letter: ", 0
    promptlen equ $-prompt
    input db 0
section .text
    _start:
        mov rax, 1
        mov rdi, 1
        mov rsi, prompt
        mov rdx, promptlen
        syscall

        mov rax, 0
        mov rdi, 0
        mov rsi, input
        mov rdx, 1
        syscall

        mov rax, 1
        mov rdi, 1
        mov rsi, input
        mov rdx, 1
        syscall

        mov rax, 1
        mov rdi, 1
        mov rsi, blank
        mov rdx, 1
        syscall

        mov rax, 60
        mov rdi , 0
        syscall