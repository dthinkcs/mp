data segment
N1 DD 0FB343CF1H
N2 DD 2CAF3FABH
RES DD ?
CARRY DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
CLC
LEA SI,N1
LEA DI,N2
LEA BX,RES
mov cx,02h
BACK:

                MOV AX, [SI]
                SBB AX,[DI]
                MOV [BX], AX
                INC SI
                INC SI
                INC DI
                INC DI
                INC BX
                INC BX
             LOOP BACK
SBB CARRY,0
MOV AH,4CH
INT 21H
CODE ENDS
END START
              
