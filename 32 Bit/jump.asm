;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                               ;;
;;   This is in no way a good example of how to use this.                        ;;
;;   This is just supposed to demonstrate how to use jump(jmp) and compare(cmp)  ;;
;;                                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BITS 32 ; tell nasm this is 32 bit code
global _start
    
section .data
    check db 20                                     ; set variable x to 10
    truest db "ecx is eqaul to 10", 0x0a        ; define the if true statement
    truelen equ $ - truest                      ; get length of the statement
    falsest db "ecx is not equal to 10", 0x0a   ; define the false statement
    falselen equ $ - falsest                    ; get length of statement
section .text
    _start:
        mov     eax, 1                          ; set 
        mov     ecx, check                      ; move 10 into ecx
        cmp     ecx, 10                         ; check if ecx is equal to ecx
        je      true                            ; jump if ecx is eqaul to 10
    true:
        mov     eax, 4                          ; set to system write
        mov     ebx, 1                          ; set to standard out
        mov     ecx, truest                     ; move true statement into ecx
        mov     edx, truelen                    ; move length of statement into edx
        int     0x80                            ; call the kernel
        jmp     exit                            ; jump to exit
    exit:
        mov     eax, 1                          ; set to system exit
        mov     ebx, 0                          ; define error code
        int     0x80                            ; call the kernel
