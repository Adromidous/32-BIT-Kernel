;;; PRINT STRING
;;; INPUT: SI register -> Source Register which holds string to print
;;; OUTPUT: TERMINAL

print_string:
	pusha
	mov ah, 0x0E 			; INT 10, 0E setup

print_char:

	mov al, [si] 			; Move character at pointer into AL
	cmp al, 0			; If AL holds null character
	je exit_print			; Exit the print
	int 0x10 			; Interrupt to print character in AL register
	inc si
	jmp print_char			; Loop back to print char	

exit_print:
	popa
	ret
