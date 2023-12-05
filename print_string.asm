print_string:
    mov al, [bx] ; Move character to AL
    cmp al, 0 ; Check if null character

    je exit_print ; If null, jump to exit

    int 0x10 ; Print character
    add bx, 1 ; Increment string pointer

    jmp print_string ; Jump back to start

exit_print:
    ret