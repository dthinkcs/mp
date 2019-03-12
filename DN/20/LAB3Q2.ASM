DATA SEGMENT
        DEC1 DB 34H
        DEC2 DB 56H
        RESULT DB ?
        CARRY DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        CLC
        MOV AL,DEC1
        ADC AL,DEC2
        DAA
        LEA SI,RESULT
        MOV [SI],AL
        ADC CARRY,0
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
        
