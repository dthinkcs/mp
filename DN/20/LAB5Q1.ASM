DATA SEGMENT
        BCD dW 1234H
        HEX dW ?
DATA ENDS

CODE SEGMENT
        ASSUME DS:DATA, CS:CODE
START:
        MOV AX,DATA
        MOV DS,AX
        MOV AX,BCD
        MOV BX,000AH
        MOV CL,04H
        SHR AX,CL
        MUL BX
        MOV CX,BCD
        AND     
                
