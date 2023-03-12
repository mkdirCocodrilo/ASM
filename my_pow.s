.data
format: 
    .asciz "%ld\n"  

.text
.global my_pow 
.global main

main:
    mov     $9, %rdi
    call    my_pow
    ret

my_pow:
    mov     $1, %r12
    mov     %rdi, %r13
loop:
    mov     $format, %rdi
    mov     %r12, %rsi
    mov     $0, %eax
    call    printf
    shlq    $1, %r12
    dec     %r13
    jnl     loop
end:
    mov     $0, %rax
    ret