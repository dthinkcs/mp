DATA SEGMENT
        A DB 32H
        B DB 28H
        SUM DB ?
        CARRY DB 0
DATA ENDS

CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX

       
        MOV AL,A
        ADD AL,B
        DAA
        MOV SUM,AL
        ADC CARRY,0

        MOV AH,4CH
        INT 21H
      CODE ENDS
END START

