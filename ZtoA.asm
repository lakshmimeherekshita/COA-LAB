
org 100h          ; Set starting address for .COM programs

mov al, 'Z'       ; Initialize AL with ASCII value of 'Z'
print_loop:
    mov dl, al    ; Move the current character in AL to DL for printing
    mov ah, 2     ; DOS function to print a character in DL
    int 21h       ; Call interrupt to print the character

    dec al        ; Move to the previous character (Z -> Y -> X ...)
    cmp al, 'A'   ; Compare AL with ASCII value of 'A'
    jge print_loop ; If AL >= 'A', repeat the loop

; Exit the program
mov ah, 4Ch       ; DOS function to exit program
int 21h           ; Call interrupt