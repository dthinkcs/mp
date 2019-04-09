DATA SEGMENT
        A DW 9283H
        B DW 8321H
        SUM DW ?
        CARRY DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AX,A
        SUB AX,B
        MOV SUM,AX
        SBB CARRY,0

        MOV AH,4CH
        INT 21H
      CODE ENDS
END START

