DATA SEGMENT
        num1 dW 1234H
        num2 dW 0025
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV AX,0;
        MOV BX,0;
        MOV CX,num2
  BACK: ADD AX,num1
        XCHG BX,AX
        ADC AX,0
        XCHG BX,AX
        LOOP BACK
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
