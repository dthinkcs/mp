DATA SEGMENT
        BCD DB ?
        HEX DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AL,BCD
        MOV AH,0
        MOV BL,16
        DIV BL
        MOV DL,AH
        MOV BL,0AH
        MUL BL
        ADD AL,DL
        MOV HEX,AL

        MOV AH,4CH
        INT 21H

     CODE ENDS
END START
