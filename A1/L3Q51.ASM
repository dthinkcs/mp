DATA SEGMENT
        A DW 9234H
        B DW 8321
        SUM DW ?
        CARRY DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        LEA SI,A
        LEA DI,B
        MOV CX,2
        CLC
      BACK:
        MOV AL,[SI]
        ADC AL,[DI]
        DAA
        MOV SUM[SI],AL
        INC SI
        INC DI
      LOOP BACK
        ADC CARRY,0

        MOV AH,4CH
        INT 21H
      CODE ENDS
END START

