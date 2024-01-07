[org 0]
[BITS 16]

startKernel:
	mov si, kernelPrint
	call print_string
	
	jmp kernel_exit
	
	%include "print_string.asm"


kernelPrint: db "Kernel Booted!", 0

kernel_exit:
	cli
	hlt

times 512 - ($-$$) db 0
