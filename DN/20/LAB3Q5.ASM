DATA SEGMENT
        NUM1 DD 98765432H
        NUM2 DD 123489ACH
        RES DD ?
        BOR DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV CX,02
        CLC
        LEA SI,NUM1
        LEA DI,NUM2
        LEA BX,RES
  BACK: MOV AX,[SI]
        SBB AX,[DI]
        MOV [BX],AX
        INC SI
        INC SI
        INC DI
        INC DI
        INC BX
        INC BX
        LOOP BACK
        SBB BOR, 0
        MOV AH,4CH
        INT 21H         
CODE ENDS
END START
