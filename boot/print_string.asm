print_string:
    pusha   ; stack current values


start:            ; assuming that starting address of string is keep in bx
    mov al, [bx]  ; register bx is holding a address, move value present at that address to al
    cmp al, 0    ; check if the value is end of line i.e 0
    je done     ; if value is 0 then we are done with the string

    ; display the character
    ; invoke interrupt 0x10 set ah register 0x0e to trigger teletype output function
    mov ah, 0x0e
    int 0x10 

    add bx, 1  ; increment the address
    jmp start  ; go back to start label

done:
    popa     ; pop back the values that were stacked before calling the function
    ret       ; return



print_nl:
    pusha        ; stack current values to stack
    
    mov ah, 0x0e    
    mov al, 0x0a ; move value 10 i.e newline char in al
    int 0x10     ; generate interrupt
    mov al, 0x0d ; move to start of line, sometimes after doing new line it may stay in previous lines last horizontal position
    int 0x10
    
    popa
    ret
