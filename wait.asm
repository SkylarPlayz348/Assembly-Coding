BITS 64                        ;

global _start
section .data
    ; consts
    hello db "Time to wait", 0x0a
    hellolen equ $-hello
    bye db "Bye Bye", 0x0a
    byelen equ $-bye
section .text
    _start:
        mov     rax,1           ; Set to write
        mov     rdi,1           ; Set output
        mov     rsi, hello      ; Set message
        mov     rdx, hellolen   ; Set message length
        syscall                 ; Call the system kernal

        call    _wait

        mov     rax,1           ; Set to write
        mov     rdi,1           ; Set output
        mov     rsi, bye        ; Set message
        mov     rdx, byelen     ; Set message length
        syscall                 ; Call the system kernal

        mov     rax,60          ; Set to exit
        mov     rdi,0           ; Set exit code
        syscall                 ; Call the system kernal
    _wait:
        mov     rbp, rsp        ; Store the return location
        sub     rsp, 2          ; Allocate 2 spaces in the stack
        push    0               ; Set nanoseconds
        push    5               ; Set seconds
        mov     rax, 35         ; Set to nanosleep
        mov     rdi, rsp        ; Tell to wait
        xor     rsi, rsi        ; Clear rsi
        syscall                 ; Call the system kernal
        mov     rsp, rbp        ; Restore return location
        ret                     ; Return back