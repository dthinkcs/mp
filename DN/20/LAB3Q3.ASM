DATA SEGMENT
        NUM1 DD 12345678H
        NUM2 DD 0F12345ABH
        SUM DW ?
        CARRY DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:

        MOV AX,DATA
        MOV DS,AX
        LEA SI,NUM1
        LEA DI,NUM2
        LEA BX,SUM
        MOV CX,2
BACK:   MOV AX,[SI]
        ADC AX,[DI]
        MOV [BX],AX
        INC SI
        INC SI
        INC DI
        INC DI
        INC BX
        INC BX
        LOOP BACK
        ADC CARRY,0
        MOV AH,4CH
        INT 21H
CODE ENDS
END START




