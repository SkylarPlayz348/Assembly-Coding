BITS 64
global  _start
section .data
    hello db "Hello World", 0x0a
    hellolen equ $-hello
section .text
    _start:
        mov rax, 1
        mov rdi, 1
        mov rsi, hello
        mov rdx, hellolen
        syscall
        mov rax, 60
        mov rdi, 0
        syscall