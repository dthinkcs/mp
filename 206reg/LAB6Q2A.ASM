GCD_MACRO MACRO
GCD1:
CMP AX,BX
JC BIGBX
DIVAXBX:
MOV DX,0
JE EXIT
MOV AX,DX
JMP GCD1
BIGBX: XCHG AX,BX
JMP DIVAXBX
EXIT: MOV [DI],BX
ENDM
DATA SEGMENT
NUM1 DW 0090H,0040H,0050H,0060H
EXTRA DW 3 DUP (?)
GCD DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
MOV DS,AX
LEA SI,NUM1
LEA DI,NUM1+8
MOV CX,03H
BACK: MOV AX,[SI]
MOV BX,[SI+1]
GCD_MACRO
INC SI
INC SI
INC DI
LOOP BACK
MOV AH,4CH
INT 21H
CODE ENDS
END START
