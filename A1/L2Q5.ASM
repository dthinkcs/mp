DATA SEGMENT
   A DW 0000H,1111H,2222H,3333H,4444H,5555H,6666H,7777H,8888H,9999H
   LEN DB 12H
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV CL,05H
        MOV CH,0
        MOV SI,offset A
        MOV DI,offset B
        ADD DI,LEN

        BACK:
           MOV BX,[SI]
           MOV [DI],BL
           INC SI
           INC DI
        LOOP BACK


        MOV AH,4CH
        INT 21H

        CODE ENDS
END START





