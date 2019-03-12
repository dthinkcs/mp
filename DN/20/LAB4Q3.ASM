DATA SEGMENT
        num1 dW 8319H
        num2 dW 2678H
        res dD ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        LEA SI,res
        MOV AX,num1
        IMUL num2
        MOV [SI],AX
        INC SI
        INC SI
        MOV [SI],DX
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
