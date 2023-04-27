BITS 32                         ; Tell nasm this is 32 bit

global _start

section .data
    ; strucs
    timeval:
        sec  dd 0
        usec dd 0
    ; consts
    hello db "Time to wait", 0x0a
    hellolen equ $-hello
    bye db "Bye Bye", 0x0a
    byelen equ $-bye
section .text
    _start:
        mov     eax,4           ; Set to write
        mov     ebx,1           ; Set output
        mov     ecx, hello      ; set message
        mov     edx, hellolen   ; set message length
        int     0x80            ; call the system

        mov     dword [sec], 10 ; set seconds
        mov     dword [usec], 0 ; set nanoseconds
        mov     eax, 162        ; set to nanosleep
        mov     ebx, timeval    ; tell to wait
        mov     ecx, 0          ; put 0 in rcx
        int     0x80            ; call to system

        mov     eax,4           ; Set to write
        mov     ebx,1           ; Set output
        mov     ecx, bye        ; set message
        mov     edx, byelen     ; set message length
        int     0x80            ; call the system

        mov     eax,1           ; set to exit
        mov     ebx,0           ; set exit code
        int     0x80            ; call to system