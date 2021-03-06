DATA SEGMENT
    A DB 01,02,03,04,05,06,07,08,09,0AH
    B DB 0A4H
    FOUND DB 'ELEMENT FOUND$'
    NFOUND DB 'ELEMENT NOT FOUND$'
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

DISP MACRO MSG
    LEA DX,MSG
    MOV AH,09H
    INT 21H
ENDM
START:
    MOV AX,DATA
    MOV DS,AX

    MOV BL,B

    MOV CX,0AH
    MOV SI,0

    BACK:  CMP BL,A[SI]
           JZ BREAK
           INC SI
           LOOP BACK

    DISP NFOUND
    JMP EXIT

    BREAK: DISP FOUND      

    EXIT: MOV AH,4CH
          INT 21H

    CODE ENDS
END START
