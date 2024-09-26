ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)
MOV SI, 0          ; Initialize SI register to use as an index for storing characters
MOV CX, 0          ; Initialize CX to count the number of characters input
INPUT_LOOP:
  MOV AH, 01h      ; Function 01h of INT 21h to read a character from input
  INT 21h          ; Call DOS interrupt to get the character
  CMP AL, 0Dh      ; Check if the character is 'Enter' (ASCII code 0Dh)
  JE DISPLAY       ; If yes, jump to DISPLAY to print the characters
  MOV message[SI], AL ; Store the character in the message array
  INC SI           ; Move to the next position in the array
  INC CX           ; Increment the character count
  JMP INPUT_LOOP   ; Repeat the loop to read the next character
DISPLAY:
  MOV SI, 0        ; Reset SI to start from the beginning of the message
  MOV AH, 02h      ; Function 02h of INT 21h is used to print a character
PRINT_LOOP:
  MOV DL, message[SI] ; Move the character at SI into DL
  CMP CX, 0        ; Check if all characters are printed
  JE EXIT          ; If yes, jump to exit
  INT 21h          ; Call DOS interrupt to print the character
  INC SI           ; Move to the next character in the string
  DEC CX           ; Decrease character count
  JMP PRINT_LOOP   ; Repeat the loop

EXIT:
  MOV AH, 4Ch      ; Function 4Ch of INT 21h terminates the program
  INT 21h          ; Call DOS interrupt to exit
message DB 80 DUP(?) ; Reserve 80 bytes to store the user input characters
END                ; End of program
 
