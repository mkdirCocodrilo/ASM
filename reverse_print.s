.global reverse_print

.text
reverse_print:
  movq $0, %rax
  test %rdi,%rdi
  je end
  push %rdi
  call strlen
  pop %rdi

loop:
  dec %rax
  push %rax
  push %rdi
  movb (%rdi, %rax, 1), %bl
  movb %bl, %dil
  call putchar

  pop %rdi
  pop %rax
  
  test %rax,%rax
  jnz loop
end:
  ret