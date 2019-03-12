DATA SEGMENT
        num1 dB 60H
        num2 dB 0A0H
        res dW ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV AL,num1
        IMUL num2
        MOV res,AX
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
