disk_load:
	push dx
	
	mov ah, 0x02
	mov al, dh
	mov cl, 0x02
	mov ch, 0x00
	mov dh, 0x00
	

	int 0x13

	jc disk_error

	pop dx
	cmp dh, al
	jne disk_error
	ret

disk_error:
	mov bx, DISK_ERROR_MSG
	call print_string
	call print_nl
	jmp $


DISK_ERROR_MSG db "Disk read error!", 0

