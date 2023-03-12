.global main

    .text
main:
    mov     %rdi, %rax
    mov     $2, %rax
    cmp     %rax, %rdi
    jne     bad_arg 
    mov     8(%rsi), %r12
#todo: Test argc and return code
open:
    mov     $0x02, %rax
    mov     %r12, %rdi
    mov     $0, %rsi
    mov     $0, %rdx
    syscall
    # Test FD
    mov     $3, %rdi
    # If not file found
    cmp     %rdi, %rax
    jl      no_file
    mov     %rax, %r13

# %r12 : filename
# %r13 : fd

read:
    mov     $0x00, %rax
    mov     %r13, %rdi
    mov     $buffer, %rsi
    mov     $3, %rdx
    syscall
    # Test return code
    xor     %rdi, %rdi
    cmp     %rdi, %rax
    je      close

write:
    mov     %rax, %rdx
    mov     $0x01,%rax
    mov     $1, %rdi
    mov     $buffer, %rsi
    syscall

    # Test return code
    xor     %rdi, %rdi
    cmp     %rdi, %rax
    jnl     read

close:
    mov     $0x03, %rax
    mov     %r13, %rdi
    syscall
    xor     %rax, %rax
    jmp     exit

bad_arg:
    mov     $1,%rax
    jmp     exit

no_file:
    mov     $2,%rax
    jmp     exit

exit:
    ret

    .data
buffer:
    .skip 3