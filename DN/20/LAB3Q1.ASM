DATA SEGMENT
        A DW 1111H
        B DW 2222H
        SUM DB ?
        CARRY DB ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV AX,A
        ADC AX,B
        LEA BX,SUM
        MOV [BX],AX
        ADC CARRY,0
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
