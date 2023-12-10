    [org 0x7c00]
    [BITS 16] ; REAL MODE -> x86 architecture starts in real mode.

    jmp short start ; First 3 bytes of FAT12 file system followed by NOP
    nop

    bpb_oem_identifier:                 db 'MSWIN4.1'
    bpb_bytes_per_sector:               dw 512 ; 512 bytes per sector
    bpb_sectors_per_cluster:            db 1  ; FAT12 uses 1 sector per cluster
    bpb_reserved_sectors:               dw 1 ; 1 sector reserved for boot sector
    bpb_num_of_fat:                     db 2 ; 2 FATs. 1 for main and second for security purposes
    bpb_root_dir_entries:               dw 0xE0 ; 16 entries which include information about the data on floppy
    bpb_total_sectors:                  dw 2880
    bpb_media_descriptor:               db 0xF0 ; 18 sectors per track -> 1440KB floppy
    bpb_sectors_per_fat:                dw 9
    bpb_sectors_per_track:              dw 18
    bpb_num_head:                       dw 2 ; Bottom and top side of floppy
    bpb_num_hidden_sectors:             dd 0 ; No hidden sectors
    bpb_large_sector_count:             dd 0

    ebr_drive_number:                   db 0 ; 0 -> Floppy, 0x80 -> Hard Disk
    ebr_flags:                          db 0
    ebr_signature:                      db 0x29 ; This can be 0x28 as well
    ebr_volume_id:                      db 0x12, 0x34, 0x56, 0x74 ; Going off of OS WIKI, common IDs
    ebr_volume_label:                   db 'TK-OS      '
    ebr_system_string:                  db 'FAT12   '



    ; CHANGING COLORS________________________________
start:
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