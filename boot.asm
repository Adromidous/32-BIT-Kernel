    [org 0x7c00]

    mov ah, 0x0b ; Color palette
    mov bh, 0x00 ; Change color
    mov bl, 0x01
    int 0x10 

    mov ah, 0x0e ; Interrupt setup
    mov bx, stringPrint

    jmp start

start:
    mov al, [bx] ; Move character to AL
    cmp al, 0 ; Check if null character

    je exitBoot ; If null, jump to exit

    int 0x10 ; Print character
    add bx, 1 ; Increment string pointer

    jmp start ; Jump back to start


stringPrint: db "HELLO WORLD!", 0

exitBoot:
    jmp $

times 510-($-$$) db 0
dw 0xAA55