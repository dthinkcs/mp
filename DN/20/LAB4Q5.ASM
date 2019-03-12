DATA SEGMENT
        num1 dW 0E32BH
        num2 dB 0E6H
        quo dB ?
        rem dB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV AX,num1
        MOV BL,num2
        MOV BH,00H
        IDIV BX
        MOV quo,AL
        MOV rem,AH
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
