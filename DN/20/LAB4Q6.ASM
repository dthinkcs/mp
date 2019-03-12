DATA SEGMENT
        num1 dD 0000FC45H
        num2 dW 2345H
        quo dB ?
        rem db ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV SI,0
        MOV BX,num2
        LEA SI,num1
        MOV AX,[SI]
        INC SI
        INC SI
        MOV DX,[SI]
        DIV BX
        MOV quo,AL
        MOV rem,AH
        MOV AH,4CH
        INT 21H
CODE ENDS
END START

