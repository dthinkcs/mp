DATA SEGMENT
   A DB 32H,49H,0A4H,5CH,92H
   LEN DB 05
   B DB 5 dup(?)
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV CL,LEN
        MOV CH,0
        MOV SI,offset A
        MOV DI,offset B

        BACK:
           MOV BL,[SI]
           MOV [DI],BL
           INC SI
           INC DI
        LOOP BACK


        MOV AH,4CH
        INT 21H

        CODE ENDS
END START





