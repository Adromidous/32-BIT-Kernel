;;; READ DISK AT SPECIFIC SECTOR
;;; INPUT: AL, CH, CL, DH, DL, ES:BX -> stanislavs.org/helppc/int_13-2/html
;;; OUTPUT: AH -> STATUS, AL -> # OF SECTORS READ, CARRY FLAG -> SUCCESS/FAIL

disk_read:
	push ax
	mov ah, 0x02				; Interrupt setup.
	
	int 0x13				; Disk Read Interrupt.

	jc disk_error				; If carry flag == 1 -> DISK ERROR!!!
	pop cx
	cmp al, cl				; Compare number of sectors read with number of sectors to read.
	je disk_success				; If both are equal...

disk_error:
	mov si, diskReadSuccess			; Disk Error String
	call print_string
	jmp disk_exit

disk_success:
	mov si, diskReadSuccess			; Disk Success String
	call print_string

disk_exit:
	mov si, diskReadExit
	call print_string
	ret

diskReadSuccess:                db "Read was successful!", 0x0D, 0x0A, 0
diskReadError:			db "Read was unsuccessful!", 0x0D, 0x0A, 0
diskReadExit:			db "Disk read exit...", 0x0D, 0x0A, 0
