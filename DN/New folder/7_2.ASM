DATA SEGMENT
A DB 32H,49H,0A4H,5CH,92H
B DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV CL,05H
        MOV CX,0
        MOV SI,OFFSET A
        MOV BL,[SI]
        MOV DI,SI+1
        MOV AL,[DI]
     BACK:   CMP BL,AL
             JNC JUMP
             XCHG BL,AL
                
        JUMP:   INC SI
                INC DI
                LOOP BACK
                MOV AH,4CH
                INT 21H
                CODE ENDS
                END START
        

        


