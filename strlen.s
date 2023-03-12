.global main

    .text

main:
    mov     $message, %rdi
    call    strlenn
    ret

message:
    .asciz  "rata"

strlenn:
    mov     $0, %rsi

loop:
    cmpb    $0, (%rdi)
    je      fin
    add     $1, %rsi
    add     $1, %rdi
    jmp     loop

fin:
    mov     %rsi, %rax
    ret


================================================================

    .global my_strlen

    .text

my_strlen:
  movq %rdi, %rax
  movq $0, %rbx
  cmpb $0, (%rax)
  je end

loop:
  inc %rbx
  inc %rax
  cmpb $0, (%rax)
  jne loop

end:
  movq %rbx, %rax
  ret