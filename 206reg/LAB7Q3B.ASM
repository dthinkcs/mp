DATA SEGMENT
A1 DB 10H,09H,08H,-07H,06H,-05H,04H,03H,02H,01H
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
MOV DS,AX
MOV CX,09
UP: LEA SI,A1
PUSH CX
BACK: MOV AL,[SI]
CMP AL,[SI+1]
JC DOWN
XCHG AL,[SI+1]
MOV [SI],AL
DOWN: INC SI
LOOP BACK
POP CX
LOOP UP
MOV AH,4CH
INT 21H
CODE ENDS
END START
