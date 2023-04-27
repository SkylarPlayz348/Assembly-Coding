BITS 64             ; Set to 64 Bits
global add42        ; Set the label that is visible outside the program

add42:              ; create label add42
    push rbp        ; Push rbp to the stack
    mov rbp, rsp    ; Move the Stack into rbp
    mov rax, rdi    ; Move the argument for our dunction into rax
    add rax, 42     ; Add 42 to the argument moved in the last instruction
    mov rsp, rbp    ; Restore the Stack
    pop rbp         ; Pop the top of rbp
    ret             ; return to the before the function was called