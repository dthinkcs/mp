DATA SEGMENT
        NUM1 dW 1234H
        NUM2 dW 2346H
        RES dD ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        LEA BX,RES
        MOV AX,NUM1
        MUL NUM2
        MOV [BX],AX
        INC BX
        INC BX
        MOV [BX],DX
        MOV AH,4CH
        INT 21H
CODE ENDS
END START

