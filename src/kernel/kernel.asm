[org 0]
[BITS 16]

    ; CHANGING COLORS________________________________
startK:
    mov ah, 0x0b ; Color palette
    mov bh, 0x00 ; Change color
    mov bl, 0x01 ; Changes color to blue
    int 0x10

    ; _______________________________________________


; PRINTING STRING________________________________

    mov ah, 0x0e ; Interrupt setup
    mov bx, kernelPrint

    call print_string

    jmp kernel_exit

    ;________________________________________________

    %include "print_string.asm"

kernelPrint: db "KERNEL BOOTED!", 0

kernel_exit:
    jmp $
