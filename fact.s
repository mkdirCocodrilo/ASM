.global main

main:
   mov   $3, %rdi
   call  fact
   ret

fact:
    push    %rbp        # Sauvegarde la valeur de rbp sur la pile
    mov     %rsp, %rbp  # Initialise rbp à l'adresse courante de la pile
    mov     $1, %rax    # Initialise rax à 1
    cmp     $0, %rdi    # Vérifie si n == 0
    je      done        # Si oui, retourne 1
    cmp     $1, %rdi    # Vérifie si n == 1
    je      done        # Si oui, retourne 1
loop:
    imul     %rdi, %rax  # Multiplie rax par n
    dec     %rdi        # Décrémente n
    cmp     $1, %rdi    # Vérifie si n == 1
    jne     loop        # Si non, retourne à loop
done:
    pop     %rbp        # Restaure la valeur de rbp depuis la pile
    ret                 # Retourne la valeur de rax