DATA SEGMENT
        num1 dD -12345678H
        num2 dW 3333H
        Q dW ?
        R dW ?
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        LEA SI,num1
        LEA DI,num1+2
        MOV BX,num2
        IDIV BX
        MOV Q,AX
        MOV R,DX
        MOV AH,4CH
        INT 21H
CODE ENDS
END START

