.text
.global my_strcpy

my_strcpy:
    // Switch rsi with rdi
    movq %rsi, %r12
    movq %rdi, %rsi
    movq %r12, %rdi

.loop:
    // Movsb :
    // Take the value pointed by (r|e)si and put it to (r|e)di, then add 1 to (r|e)si and (r|e)di
    // C:
    // *rdi = *rsi;
    //  rsi++
    //  rdi++;
    movsb

    // Loop checking
    cmpb $0, (%rsi)
    jne .loop

    ret
