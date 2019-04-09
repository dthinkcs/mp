DATA SEGMENT
   A DW 1111H,2222H,3333H,4444H,5555H,?,?
   LEN DW 0AH
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV CL,05H
        MOV CH,0H

        LEA SI,A
        ADD SI,LEN
        DEC SI
        DEC SI
        MOV DI,SI
        ADD DI,4H

        BACK:
           MOV BX,[SI]
           MOV [DI],BX
           DEC SI
           DEC SI
           DEC DI
           DEC DI
        LOOP BACK


        MOV AH,4CH
        INT 21H

        CODE ENDS
END START





