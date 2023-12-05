    [org 0x7c00]

    ; CHANGING COLORS________________________________
    
    mov ah, 0x0b ; Color palette
    mov bh, 0x00 ; Change color
    mov bl, 0x01 ; Changes color to blue
    int 0x10

    ; _______________________________________________


    ; PRINTING STRING________________________________

    mov ah, 0x0e ; Interrupt setup
    mov bx, stringPrint

    call print_string

    jmp exit_boot

    ;________________________________________________

    %include "print_string.asm"

stringPrint: db "HELLO WORLD!", 0

exit_boot:
    jmp $

times 510-($-$$) db 0
dw 0xAA55