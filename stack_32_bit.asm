;; This is the 32 bit version of stack_64_bit

BITS 32                         ; tell nasm this is 64 bit code

global _start

section .text
_start:
    sub esp, 4
    mov [esp], byte 'H'         ; Assign H to the first byte
    mov [esp+1], byte 'e'       ; Assign e to the second byte
    mov [esp+2], byte 'y'       ; Assign y to the third byte
    mov eax, 4                  ; Set to system write
    mov ebx, 1                  ; Set system out
    mov ecx, esp                ; Set text to print
    mov edx, 4                  ; Set amount of bytes to print
    int 0x80                    ; Perform a system call
    mov eax, 1                  ; Set to system exit
    mov ebx, 0                  ; Set error code
    int 0x80                    ; Perform system call