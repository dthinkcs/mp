;to accept two single digit hexadecimal numbers from the keyboard
; display their sum on the screen




DATA SEGMENT


DATA ENDS



















CODE SEGMENT

        ASSUME CS: CODE, DS: DATA

START:

        MOV AH, 4CH;
        INT 21H;
        
CODE ENDS
END START 

