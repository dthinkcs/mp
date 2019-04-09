DATA SEGMENT
        A DW -423H
        B DW 32H
        PROD1 DW 0
        PROD2 DW 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,A
        MOV BX,B
        IMUL BX

        MOV PROD2,DX
        MOV PROD1,AX

        MOV AH,4CH
        INT 21H
      
        CODE ENDS
END START
