DATA SEGMENT
X DW 0121H,2122,6013H,3134H,0015H,3706H,1056H,0408H,1909H,8550H
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
MOV DS,AX
MOV CX,09H
BACK1:PUSH CX
LEA SI,X
BACK:MOV AX,[SI]
CMP AX,[SI+2]
JC DOWN
XCHG AX,[SI+2]
MOV [SI],AX
DOWN: INC SI
INC SI
LOOP BACK
POP CX
LOOP BACK1
MOV AH,4CH
INT 21H
CODE ENDS
END START
