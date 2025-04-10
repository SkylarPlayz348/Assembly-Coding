;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                               ;;
;;   This is a little bit better of an example of how to do this than in the 32  ;;
;;   bit version. This is just supposed to demonstrate how to use jump(jmp)      ;;
;;   and compare(cmp)                                                            ;;
;;                                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BITS 64                                         ; tell nasm this is 64 bit code
global _start
    
section .data
    truest db "ecx is eqaul to 20", 0x0a        ; define the if true statement
    truelen equ $ - truest                      ; get length of the statement
    falsest db "ecx is not equal to 20", 0x0a   ; define the false statement
    falselen equ $ - falsest                    ; get length of statement
section .text
    _start:
        mov     rcx, 20
        mov     rax, 60                         ; set 
        mov     rcx, 20                         ; move 10 into ecx
        cmp     rcx, 20                         ; check if ecx is equal to ecx
        je      true                            ; jump if ecx is eqaul to 10
                                                ; all up till true: will execute unless rcx is eqaul to 20
        mov     rax, 1                          ; set to system write
        mov     rdi, 1                          ; set to standard out
        mov     rsi, falsest                    ; move true statement into ecx
        mov     rdx, falselen                   ; move length of statement into edx
        syscall                                 ; call the kernel
        jmp     exit                            ; jump to exit
    true:
        mov     rax, 1                          ; set to system write
        mov     rdi, 1                          ; set to standard out
        mov     rsi, truest                     ; move true statement into ecx
        mov     rdx, truelen                    ; move length of statement into edx
        syscall                                 ; call the kernel
        jmp     exit                            ; jump to exit
    exit:
        mov     rax, 60                         ; set to system exit
        mov     rdi, 0                          ; define error code
        syscall                                 ; call the kernel
