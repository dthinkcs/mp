DATA SEGMENT
        A DW ?
        B DW ?
        SUM DW ?
        CARRY DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV A,9234H
        MOV B,8321H
        MOV AX,A
        ADD AX,B
        MOV SUM,AX
        ADC CARRY,0

        MOV AH,4CH
        INT 21H
      CODE ENDS
END START

