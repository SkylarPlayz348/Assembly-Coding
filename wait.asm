section .data
    ; strucs
    timeval:
        sec  dd 0
        usec dd 0
    ; consts
    hello: db "Time to wait", 0x0a
    hellolen: equ $-hello
    bye: db "Bye Bye", 0x0a
    byelen: equ $-bye
section .text
    global _start
    _start:
        mov     rax,4           ; Set to write
        mov     rbx,1           ; Set output
        mov     rcx, hello      ; set message
        mov     rdx, hellolen   ; set message length
        int     0x80            ; call the system

        mov     dword [sec], 10 ; set seconds
        mov     dword [usec], 0 ; set nanoseconds
        mov     rax, 162        ; set to timer in short
        mov     rbx, timeval    ; tell to wait
        mov     rcx, 0          ; put 0 in rcx
        int     0x80            ; call to system

        mov     rax,4           ; Set to write
        mov     rbx,1           ; Set output
        mov     rcx, bye        ; set message
        mov     rdx, byelen     ; set message length
        int     0x80            ; call the system

        mov     rax,1           ; set to exit
        mov     rbx,0           ; set exit code
        int     0x80            ; call to system