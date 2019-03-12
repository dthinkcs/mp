DATA SEGMENT
        num1 dD 12345679H
        num2 dD 98765431H
        sum dW ?
        carry dB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        LEA SI,NUM1
        LEA DI,NUM2
        LEA BX,SUM
        MOV CX,4
  BACK: MOV AL,[SI]
        ADC AL,[DI]
        DAA
        MOV [BX],AL
        INC SI
        INC DI
        LOOP BACK
        ADC CARRY, 0
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
