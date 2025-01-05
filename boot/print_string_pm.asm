[bits 32]

VIDEO_MEMORY equ 0xb8000   ; memory used in x86 systems for video memory output
WHITE_ON_BLACK equ 0x0f    ; lower 4 bits represent foreground color, 1111 = white
                           ; upper 4 bites represent background color 0000 = black
print_string_pm:
	pusha           
	mov edx, VIDEO_MEMORY   ; point edx to video memory

print_string_pm_loop:
	mov al, [ebx]             ; move first char in al
	mov ah, WHITE_ON_BLACK    ; move color code in ah

	cmp al, 0                ; check if end of string
	je print_string_pm_done   ; if it is end then done

	mov [edx], ax            ; store value at address pointed by edx
	
	add edx, 2              ; increment edx to next place, next char if any will be stored at new place
	add ebx, 1             ; increment to next char of input string

	jmp print_string_pm_loop   ; continue with loop

print_string_pm_done:
	popa 
	ret
