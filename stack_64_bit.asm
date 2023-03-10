;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                      ;;
;;      This may look different than the other but that's because of    ;;
;;      how I had to code it for x86_64 you can check out the 32 bit    ;;
;;      version on the one labeled 32 bit                               ;;
;;                                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


BITS 64                         ; tell nasm this is 64 bit code

global _start

section .text
_start:
    sub rsp, 4
    mov [rsp], byte 'H'         ; Assign H to the first byte
    mov [rsp+1], byte 'e'       ; Assign e to the second byte
    mov [rsp+2], byte 'y'       ; Assign y to the third byte
    mov rax, 1                  ; Set to system write
    mov rdi, 1                  ; Set system out
    mov rsi, rsp                ; Set text to print
    mov rdx, 4                  ; Set amount of bytes to print
    syscall                     ; Perform a system call
    mov rax, 60                 ; Set to system exit
    mov rdi, 0                  ; Set error code
    syscall                     ; Perform system call