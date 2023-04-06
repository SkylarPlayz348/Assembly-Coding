BITS 64

global _start

section .data
    blank db "", 0x0a
    prompt db "Type a letter: ", 0x0a
    promptlen equ $-prompt
    input db 0
section .text
    _start:
        mov rax, 1                      ; Set system call to write
        mov rdi, 1                      ; Set to standard out
        mov rsi, prompt                 ; Move promt string into rsi
        mov rdx, promptlen              ; Move the length of prompt into rdx
        syscall                         ; Call the system kernal

        mov rax, 0                      ; Set system call to read
        mov rdi, 0                      ; Set to standard in
        mov rsi, input                  ; Put value into variable input
        mov rdx, 1                      ; Setting number of bytes to store
        syscall                         ; Call system kernal

        mov rax, 1                      ; Set system call to write
        mov rdi, 1                      ; Set to standard out
        mov rsi, input                  ; Move value of input to be printed
        mov rdx, 1                      ; Set length of output
        syscall                         ; call system kernal

        mov rax, 1                      ; Set system call to write
        mov rdi, 1                      ; Set to standard out
        mov rsi, blank                  ; Move value of variable blank into rsi
        mov rdx, 1                      ; Set number of bytes
        syscall                         ; Call system kernal

        mov rax, 60                     ; Set system call to exit
        mov rdi , 0                     ; Set exit code to 0
        syscall                         ; Call system kernal