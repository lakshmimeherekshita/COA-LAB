org 100h          

mov al, 'A'       
print_loop:
    mov dl, al    
    mov ah, 2     ; DOS function to print a character in DL
    int 21h       ; Call interrupt to print the character

    inc al        
    cmp al, 'Z'   ; Compare AL with ASCII value of 'Z'
    jle print_loop 

; Exit the program
mov ah, 4Ch       ; DOS function to exit program
int 21h           ; Call interrupt