DATA SEGMENT
        NUM1 DT 12345678987654321234H
        NUM2 DT 12123456789087654321H
        RES DT ?
        BOR DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV CX,05H
        MOV SI,NUM1
        MOV DI,NUM2
        LEA BX,RES
        CLC
  BACK: MOV AX,[SI]
        MOV AX,[DI]
        INC SI
        INC DI
        INC BX
        INC SI
        INC DI
        INC BX
        LOOP BACK
        SBB BOR,0
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
