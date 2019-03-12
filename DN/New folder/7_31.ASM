DATA SEGMENT
A DB 32H,49H,0A4H,5CH,92H
COUNT DW 05H
B DB 'SORTED'
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
BACK:   MOV SI,0
        MOV Cx,COUNT
        DEC CX
        MOV DX,CX
        SUB CX,SI
        MOV DI,0
BACK1:  MOV AL,A[DI]
        CMP AL,A[DI+1]
        JC SKIP
        XCHG AL,A[DI+1]
        MOV A[DI],AL
SKIP:   INC DI
        LOOP BACK1
        INC SI
        CMP SI,DX
        JC BACK
        LEA DX,B
        MOV AH,9H
        INT 21H
        MOV AH,4CH
        INT 21H

        CODE ENDS
        END START
