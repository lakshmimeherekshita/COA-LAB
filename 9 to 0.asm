org 100h          ; Set starting address for .COM programs

mov cx, 10        ; Initialize counter to 10 (for numbers 0-9)
mov al, '9'       ; Start with ASCII character '0'

print_loop:
    mov dl, al    ; Move the current character to DL for printing
    mov ah, 2     ; DOS function 2 to print a character
    int 21h       ; Call interrupt to print the character in DL

    dec al        ; Move to the next character
    loop print_loop  ; Decrement CX and repeat if not zero

; Print a newline after the numbers
mov dl, 0Dh       ; Carriage return
mov ah, 2         ; DOS function 2 to print a character
int 21h           ; Call interrupt

mov dl, 0Ah       ; Line feed
mov ah, 2         ; DOS function 2 to print a character
int 21h           ; Call interrupt

; Exit the program
mov ah, 4Ch       ; DOS function to exit program
int 21h          