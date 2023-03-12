.global my_add

    .text
my_add:
    mov    %edi,%edx
    mov    %esi,%eax
    add    %edx,%eax
    retq