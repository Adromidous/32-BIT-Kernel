[org 0x7c00] ; Offset to 0x7c00
[BITS 16] ; Bootloader in Real Mode. Need to get necessary data for kernel

	mov si, bootloaderPrint
	call print_string

	mov al, 1			; Number of sectors to read
	mov ch, 0			; Cylinder/Track Number
	mov cl, 2			; Sector Number -> Number 2 since bootloader is at 1
	mov dh, 0			; Head Number
	mov dl, 0			; Drive Number

	mov bx, 0x1000			; Going to jump to ES:BX -> 0x1000:0x0000 -> Kernel stored here. 
	mov es, bx
	xor bx, bx			; Zero out contents of BX register.			
	
	call disk_read
	
	mov ax, 0x1000
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

	jmp 0x1000:0x0000		; Jump to kernel.

	%include "print_string.asm"
	%include "disk_read.asm"

bootloaderPrint: 			db "Bootloader Loaded!", 0x0D, 0x0A, 0

times 510-($-$$) db 0
dw 0xAA55
