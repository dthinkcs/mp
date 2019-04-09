Data Segment
        BCD dW 1234H
        ls dB ?
        MS DB ?
        HEX DW ?
        CARRY DB ?
DATA ENDS
        CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        start:
        MOV AX,DATA
        MOV DS,AX
        MOV BX,BCD
        MOV CL,04
        SHR AL,CL
        MOV DL,0AH
        MUL DL
        MOV CL,BL
        AND CL,0FH
        ADD AL,CL
        MOV LS,AL
        MOV AL,BH
        MOV CL,04
        SHR AL,CL
        MOV DL,0AH
        MUL DL
        MOV CL,BH
        AND CL,0FH
        ADD AL,AL
        MOV MS,AL
        MOV AX,0
        MOV AL,MS
        MOV BL,100
        MUL BL
        MOV BX,0
        MOV BL,LS
        ADD AX,BX
        ADC CARRY,0
        MOV HEX,AX
        MOV AH,4CH
        INT 21H
        CODE ENDS
        END START
      

