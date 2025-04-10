// Taken from a youtube video. Will add credit when I find it again
.global _main
.align 2

.data
    hellostr:
    .acsiz "Hello Worl\n"

.text
    _main:
        adr X0, hellostr
        mov X0, #0
        mov X16, #1
        mov X17, #0
        svc 0h