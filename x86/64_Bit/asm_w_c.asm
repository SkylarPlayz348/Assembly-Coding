BITS 64                             ; Tell nasm this is a 64 bit program
global main                         ; Add entry point as label main
extern printf                       ; Call external function printf
section .data
    fmt db "%s", 0x0a, 0x00         ; Since this code is using a C function(printf) we have to add 0x00 to tell our linker(gcc) that this is the end of the string
    msg db "Hello world!", 0x00     ; Same thing as above but doesn't have 0x0a since this replace %s once program is run
section .text
    main:                           ; Define label main
        push rbp                    ; Push rbp to the Stack
        mov rax, 0                  ; Moving the value of 0 into rax
        mov rdi, fmt                ; Move the preformatted output waiting for a string into rdi
        mov rsi, msg                ; Move the string we want to display in fmt into rsi
        call printf wrt ..plt       ; This tells the linker to allow for memory relocation
        pop rbp                     ; Pop the last value off the stack and put it in rbp
        xor rax, rax                ; Cancel out rax making the value 0
        ret                         ; Return from Function