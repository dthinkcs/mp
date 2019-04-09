DATA SEGMENT
        num1 dB 11H
        num2 dB 22H
        RES DB ?
        CARRY DB 0
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

        MOV AL,NUM1
        CLC
        ADD AL,NUM2
        MOV RES,AL
        ADC CARRY,0

        MOV AH,4CH
        INT 21H
CODE ENDS
END START

