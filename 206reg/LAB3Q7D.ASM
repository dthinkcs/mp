DATA SEGMENT
N1 DT 1234567883210ABCH
N2 DT 11234567856A7B89H
RES DT ?
BORROW DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
MOV CX,10
LEA SI,N1
LEA DI,N2
LEA BX,RES
CLC
BACK:
MOV AL,[SI]
SBB AL,[DI]
DAS
MOV [BX],AL
INC SI
INC DI
INC BX
LOOP BACK
SBB BORROW,0
MOV AH,4CH
INT 21H
CODE ENDS
END START
