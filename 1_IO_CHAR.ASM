DATA SEGMENT
        
        MSG DB 'ENTER A CHARACTER: $ ';
        NXTLINE DB 10, 13, '$'
        MSG2 DB 'ECHO: $';
DATA ENDS

DISP MACRO M
        LEA DX, M
        MOV AH, 09H;
        INT 21H

ENDM

IN_AL MACRO 
        MOV AH, 01H;
        INT 21H;
ENDM

IN_AL_NE MACRO
        MOV AH, 08H;
        INT 21H;
ENDM

OUT_DL MACRO
        MOV DL, AL;

        MOV AH, 02H;
        INT 21H;
ENDM

EXIT_MAC MACRO
        MOV AH, 4CH;
        INT 21H;
ENDM

CODE SEGMENT
        ASSUME CS: CODE, DS: DATA
START:
        MOV DX, DATA
        MOV DS, DX


        DISP MSG

        IN_AL_NE 

        DISP NXTLINE

        DISP MSG2

        DISP NXTLINE

        OUT_DL

        EXIT_MAC
CODE ENDS
END START
