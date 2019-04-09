DATA SEGMENT
        A DB 3AH
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE

HEX_ASCII:
    CMP DL,0AH
    JC L1
      ADD DL,7
    L1: ADD DL,30H
RET

NEW_PROS:
        MOV DL,BL
        CALL HEX_ASCII
        MOV AH,02
        INT 21H

        MOV DL,BH
        CALL HEX_ASCII        
        MOV AH,02
        INT 21H

        MOV DL,'H'
        MOV AH,02
        INT 21H


RET


START:
        MOV AX,DATA
        MOV DS,AX

        MOV AL,A
        MOV AH,0
        MOV BL,10H
        DIV BL
        MOV BX,AX

        CALL NEW_PROS
        
        MOV AH,4CH
        INT 21H
CODE ENDS
END START

