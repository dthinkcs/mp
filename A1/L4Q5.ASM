DATA SEGMENT
        A DW -222H
        B DB 32H
        QUOT DB 0
        REM DB 0
      
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,A
        MOV BL,B
        IDIV BL

        MOV REM,AH
        MOV QUOT,AL

        MOV AH,4CH
        INT 21H
      
        CODE ENDS
END START
